import gleam/list
import gleam/result
import gleam/string

pub fn message(log_line: String) -> String {
  string.split(log_line, ":") 
  |> list.last 
  |> result.unwrap("") 
  |> string.trim
}

pub fn log_level(log_line: String) -> String {
  string.split(log_line, ":")
  |> list.first
  |> result.unwrap("")
  |> string.replace("[", "")
  |> string.replace("]", "")
  |> string.lowercase
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
