pub fn handle(
  _request : @types.IncomingRequest,
  _response_out : @types.ResponseOutparam
) -> Unit {
  let response = match _request.path_with_query() {
    None | Some("/") => make_response("Hello, World")
    _ => make_response("Not Found", status_code = NotFound, content_type = "application/json")
  }
  _response_out.set(response |> Ok)
}