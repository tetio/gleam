import gleam/int
import gleam/io
import gleam/list
import gleam/result
import gleam/string

pub fn convert(number: Int) -> String {
  let sm = string.to_graphemes(string.pad_left(int.to_string(number), 4 , "0"))
  let m = int.parse(list.first(sm) |> result.unwrap("0")) |> result.unwrap(0)
  let sc = list.drop(sm, 1)
  let c = int.parse(list.first(sc) |> result.unwrap("0")) |> result.unwrap(0)
  let sd = list.drop(sc, 1)
  let d = int.parse(list.first(sd) |> result.unwrap("0")) |> result.unwrap(0)
  let u = number % 10
  do_m(m) <> do_c(c) <> do_d(d) <> do_u(u)
}

fn do_m(number) -> String {
  case number {
    i if i > 2 -> "MMM"
    i if i > 1 -> "MM"
    i if i > 0 -> "M"
    _ -> ""
  }
}

fn do_c(number) -> String {
  case number {
    i if i > 8 -> "CM"
    i if i > 7 -> "DCCC"
    i if i > 6 -> "DCC"
    i if i > 5 -> "DC"
    i if i > 4 -> "D"
    i if i > 3 -> "CD"
    i if i > 2 -> "CCC"
    i if i > 1 -> "CC"
    i if i > 0 -> "C"
    _ -> ""
  }
}

fn do_d(number) -> String {
  case number {
    i if i > 8 -> "XC"
    i if i > 7 -> "LXXX"
    i if i > 6 -> "LXX"
    i if i > 5 -> "LX"
    i if i > 4 -> "L"
    i if i > 3 -> "XL"
    i if i > 2 -> "XXX"
    i if i > 1 -> "XX"
    i if i > 0 -> "X"
    _ -> ""
  }
}

fn do_u(number) -> String {
  case number {
    i if i > 8 -> "IX"
    i if i > 7 -> "VIII"
    i if i > 6 -> "VII"
    i if i > 5 -> "VI"
    i if i > 4 -> "V"
    i if i > 3 -> "IV"
    i if i > 2 -> "III"
    i if i > 1 -> "II"
    i if i > 0 -> "I"
    _ -> ""
  }
}
