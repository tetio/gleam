import gleam/list
import gleam/string

pub fn build(letter: String) -> String {
  let alphabet = [
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O",
    "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
  ]
  let candidates = alphabet |> list.take_while(fn(e) { letter != e }) |> list.append([letter])
  let num_letters = list.length(candidates)
  let triangle = candidates |> list.index_map(fn(e,i) { make_triangle(e, i, num_letters) })
  let diamond = triangle |> list.append(triangle |> list.reverse |> list.drop(1))
  string.concat(diamond) |> string.drop_right(1)
}

fn make_triangle(letter: String, index: Int, num_letters: Int) -> String {
  let #(external_padding, internal_padding) = calculate_paddings(num_letters, index)
  case letter {
    "A" -> make_first_line(external_padding, letter)
    _ -> make_line(external_padding, internal_padding, letter)
  }
}

fn make_first_line(external_padding: Int, letter: String) -> String{
  string.repeat(" ", external_padding)
  <> letter
  <> string.repeat(" ", external_padding)
  <> "\n"
}

fn make_line(external_padding: Int, internal_padding: Int, letter: String) -> String {
  string.repeat(" ", external_padding)
  <> letter
  <> string.repeat(" ", internal_padding)
  <> letter
  <> string.repeat(" ", external_padding)
  <> "\n"
}

fn calculate_paddings(num_letters: Int, index: Int) -> #(Int, Int) {
  let diagonal = {num_letters * 2} - 1
  let external_padding = num_letters - index - 1
  case index {
    0 -> #(external_padding, 0)
    _ -> #(external_padding, diagonal - external_padding * 2 - 2)
  }
}