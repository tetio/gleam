pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  case list {
    [] -> []
    [x, ..xs] ->
      case predicate(x) {
        True -> [x, ..keep(xs, predicate)]
        False -> keep(xs, predicate)
      }
  }
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  case list {
    [] -> []
    [x, ..xs] ->
      case predicate(x) {
        True -> discard(xs, predicate)
        False -> [x, ..discard(xs, predicate)]
      }
  }
}
