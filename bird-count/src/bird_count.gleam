pub fn today(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [x, ..] -> x
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [x, ..tail] -> [x + 1, ..tail]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [] -> False
    [0, ..] -> True
    [_, ..tail] -> has_day_without_birds(tail)
  }
}

pub fn total(days: List(Int)) -> Int {
  tr_total(days, 0)
}

fn tr_total(days: List(Int), acc: Int) -> Int {
  case days {
    [] -> acc
    [x, ..tail] -> tr_total(tail, acc + x)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  tr_busy_days(days, 0)
}

fn tr_busy_days(days: List(Int), acc: Int) -> Int {
  case days {
    [] -> acc
    [x, ..tail] if x >= 5 -> tr_busy_days(tail, acc + 1)
    [_, ..tail] -> tr_busy_days(tail, acc)
  }
}
