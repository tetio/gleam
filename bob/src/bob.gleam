import gleam/result
import gleam/string

fn is_all_in_uppercase(s) -> Bool {
  s == string.uppercase(s) && s != string.lowercase(s)
}

fn is_a_question(s) -> Bool {
  string.last(string.trim(s)) |> result.unwrap("") == "?"
}

fn is_silence(s) -> Bool {
  string.is_empty(string.trim(s))
}

pub fn hey(remark: String) -> String {
  case is_all_in_uppercase(remark), is_a_question(remark), is_silence(remark) {
    _, _, True -> "Fine. Be that way!"
    True, False, _ -> "Whoa, chill out!"
    False, True, _ -> "Sure."
    True, True, _ -> "Calm down, I know what I'm doing!"
    _, _, _ -> "Whatever."
  }
}
