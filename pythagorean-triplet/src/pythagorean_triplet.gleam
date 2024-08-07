import gleam/list

pub type Triplet {
  Triplet(Int, Int, Int)
}

pub fn triplets_with_sum(sum: Int) -> List(Triplet) {
  next_triplet(sum, Triplet(0, 0, 0), [])
  |> list.filter(fn(t) {
    let Triplet(a, b, c) = t
    a < b && b < c && a * a + b * b == c * c
  })
}

fn next_triplet(sum: Int, t: Triplet, acc: List(Triplet)) -> List(Triplet) {
  let Triplet(a, b, c) = t
  let acc2 = case a + b + c == sum {
    True -> acc |> list.prepend(t)
    _ -> acc
  }
  case c >= sum/2 , b >= sum/2, a >= sum/2 {
    True, True, True -> acc2
    True, True, False -> next_triplet(sum, Triplet(a + 1, b, c), acc2)
    True, False, _ -> next_triplet(sum, Triplet(a, b + 1, c), acc2)
    False, True, _ -> next_triplet(sum, Triplet(a, 0, c + 1), acc2)
    False, False, True -> next_triplet(sum, Triplet(0, b + 1, c), acc2)
    False, False, False -> next_triplet(sum, Triplet(a + 1, b, c), acc2)
  }
}
