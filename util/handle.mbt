///|
pub struct Person {
  name : String
  age : Int
} derive(Eq, Show, ToJson)

///|
pub fn handle(
  _request : @types.IncomingRequest,
  _response_out : @types.ResponseOutparam
) -> Unit {
  let response = match _request.path_with_query() {
    None | Some("/") => make_response("Bon jour!")
    Some("/json") =>
      make_response(
        Person::{ name: "Alice", age: 42 } as &ToJson,
        content_type=b"application/json",
      )
    _ => make_response(b"Not Found", status_code=NotFound)
  }
  _response_out.set(response |> Ok)
}
