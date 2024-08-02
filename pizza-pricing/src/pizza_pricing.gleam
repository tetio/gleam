import gleam/list

pub type Pizza {
  Caprese
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
  Formaggio
  Margherita
}

pub fn pizza_price(pizza: Pizza) -> Int {
  tr_pizza_price(pizza, 0)
}

fn tr_pizza_price(pizza: Pizza, acc) -> Int {
  case pizza {
    Caprese -> 9 + acc
    Formaggio -> 10 + acc
    Margherita -> 7 + acc
    ExtraSauce(p) -> tr_pizza_price(p, acc + 1)
    ExtraToppings(p) -> tr_pizza_price(p, acc + 2)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let partial_price = tr_order_price(order, 0)
  case list.length(order) {
    1 -> partial_price + 3
    2 -> partial_price + 2 
    _ -> partial_price
  }
}

fn tr_order_price(order: List(Pizza), acc) -> Int {
  case order {
    [] -> acc
    [a, ..tail] -> tr_order_price(tail, acc + pizza_price(a))
  }
}