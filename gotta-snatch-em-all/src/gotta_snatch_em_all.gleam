import gleam/list
import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(set.contains(collection, card), set.insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let valid_trade =
    set.contains(collection, my_card) && !set.contains(collection, their_card)
  #(valid_trade, set.delete(collection, my_card) |> set.insert(their_card))
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  collections 
  |> reduce(set.intersection) 
  |> set.to_list
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections 
  |> reduce(set.union) 
  |> set.size()
}

fn reduce(
  l: List(Set(String)),
  func: fn(Set(String), Set(String)) -> Set(String),
) -> Set(String) {
  case l {
    [x, ..xs] -> list.fold(xs, x, func)
    [] -> set.new()
  }
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection |> set.filter(fn(b) { string.starts_with(b, "Shiny ") })
}
