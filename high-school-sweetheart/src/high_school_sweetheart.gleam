import gleam/list
import gleam/result
import gleam/string

pub fn first_letter(name: String) {
  string.trim(name)
  |> string.first
  |> result.unwrap("")
}

pub fn initial(name: String) {
  first_letter(name)
  |> string.uppercase
  |> string.append(".")
  
}

pub fn initials(full_name: String) {
  string.split(full_name, " ")
  |> list.map(initial)
  |> string.join(" ")
}

pub fn pair(full_name1: String, full_name2: String) {
  let initials = initials(full_name1) <> "  +  " <> initials(full_name2)
  "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     " <> initials <> "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
}
