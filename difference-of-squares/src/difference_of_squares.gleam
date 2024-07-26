fn sum_sequence_tr(n: Int, acc: Int) -> Int {
  case n > 0 {
    True -> sum_sequence_tr(n-1, acc + n)
    _ -> acc
  }
}

pub fn square_of_sum(n: Int) -> Int {
  let sum = sum_sequence_tr(n, 0)
  sum * sum
}

fn sum_of_squares_tr(n: Int, acc: Int) -> Int {
  case  n > 0  {
    True -> sum_of_squares_tr(n-1, acc + n*n)
    _ -> acc
  }
}

pub fn sum_of_squares(n: Int) -> Int {
  sum_of_squares_tr(n, 0)
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
