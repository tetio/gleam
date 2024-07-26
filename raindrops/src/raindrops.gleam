import gleam/int

pub fn convert(number: Int) -> String {
  case number % 3 == 0, number % 5 == 0, number % 7 == 0 {
    True, True, True -> "PlingPlangPlong"
    True, True, False -> "PlingPlang"
    True, False, False -> "Pling"
    False, True, False -> "Plang"
    False, False, True -> "Plong"
    False, True, True -> "PlangPlong"
    True, False, True -> "PlingPlong"
    _, _, _ -> int.to_string(number)
  }
}
