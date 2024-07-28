import gleam/set
import gleam/list
pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  list.map(factors, fn(e) {list.range(e, limit-1) |> list.filter(fn(t) {t >= e}) |> list.filter(fn(t) {t % e == 0})})
    |> list.flatten
    |> set.from_list
    |> set.fold(0, fn(acc, e) {acc + e})
}
