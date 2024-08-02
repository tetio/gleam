import gleam/float
import gleam/list
import gleam/order.{type Order}

pub const f2c_d = 1.8

pub const f2c_s = 32.0

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. f2c_s } /. f2c_d
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  float.compare(get_celsius(left), get_celsius(right))
}

fn get_celsius(t: Temperature) -> Float {
  case t {
    Celsius(n) -> n
    Fahrenheit(n) -> fahrenheit_to_celsius(n)
  }
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  cities
  |> list.sort(by: fn(a, b) {
    compare_temperature(a.temperature, b.temperature)
  })
}
