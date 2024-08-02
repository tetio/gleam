import gleam/result
import gleam/list
import gleam/io
import gleam/option.{type Option, Some}
import gleam/string
import gleam/regex.{type Match}

pub fn is_valid_line(line: String) -> Bool {
  let assert Ok(re) = regex.from_string("\\[(\\w+)\\]")
  let matches = regex.scan(with: re, content: line)
    io.debug(matches)
  case matches {
    [] -> False
    [match, .._] ->  is_a_log_level(match.submatches)
  }
}

fn is_a_log_level(sm: List(Option(String))) -> Bool {
  io.debug(sm)
  let m = sm |> list.first |> result.unwrap(Some("")) |> option.unwrap("")
  m == "DEBUG" 
  ||m == "INFO"
  ||m == "WARNING"
  ||m == "ERROR"
}

pub fn split_line(line: String) -> List(String) {
  let assert Ok(re) = regex.from_string("<[*~\\-=]*>")
  let line = regex.replace(each: re, in: line, with: "\n")
  string.split(line, "\n")
}

pub fn tag_with_user_name(line: String) -> String {
  let assert Ok(re) = regex.from_string("User[\\t\\s\\n]+([\\w_🙂!]+)[\\t\\s\\n]*")
  let matches = regex.scan(with: re, content: line)
  case matches {
    [] -> line
    _ -> get_users(matches, "") <> line
  }
  
}

fn get_users(matches: List(Match), acc: String) -> String {
  case matches {
    [] -> acc
    [sm, ..tail] -> get_users(tail, get_user(sm) <> acc)
  }
}

fn get_user(match: Match) -> String {
  case match.submatches {
    [] -> ""
    [a, .._] -> "[USER] " <> a |> option.unwrap("") |> string.trim <> " "
  }
}