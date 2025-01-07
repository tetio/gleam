import gleam/dict.{type Dict}
import gleam/list
import gleam/result

pub fn lowest_price(books: List(Int)) -> Float {
  let grouped_books = group_books(books, dict.new())
  let num_different_books = grouped_books |> dict.keys |> list.length
  // case books, num_different_books, list.length(books) {
  //   [], _, _ -> 0.0
  //   [1, .._], _, _ -> 800.0
  //   _, _, _ -> 0..
  //  // _, a, b -> if a == b ->
  // }
  //
  //
  0.0
}

fn group_books(books: List(Int), grouped: Dict(Int, Int)) -> Dict(Int, Int) {
  case books {
    [] -> grouped
    [x, ..xs] ->
      case dict.get(grouped, x) {
        Ok(value) -> group_books(xs, grouped |> dict.insert(x, value + 1))
        Error(_) -> group_books(xs, grouped |> dict.insert(x, 1))
      }
  }
}
