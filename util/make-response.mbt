///| convert an fixed array of bytes which represent UTF-16 characters
/// to an fixed array of bytes which represent ascii characters 
fn to_ascii(utf16 : FixedArray[Byte]) -> FixedArray[Byte] {
  let ascii : Array[Byte] = Array::new()
  for i = 0; i < utf16.length() / 2; i = i + 1 {
    ascii.push(utf16[i * 2])
  }
  FixedArray::from_array(ascii)
}

///|
trait ToBody {
  to_body(Self) -> FixedArray[Byte]
}

///|
pub impl ToBody for FixedArray[Byte] with to_body(self : FixedArray[Byte]) -> FixedArray[
  Byte,
] {
  self
}

///|
pub impl ToBody for Bytes with to_body(self : Bytes) -> FixedArray[Byte] {
  self.to_fixedarray()
}

///|
pub impl ToBody for String with to_body(self : String) -> FixedArray[Byte] {
  @base64.str2bytes(self).to_fixedarray()
}

///|
pub impl ToBody for &ToJson with to_body(self : &ToJson) -> FixedArray[Byte] {
  @base64.str2bytes(self.to_json().stringify()).to_fixedarray()
}

///| `make_response` makes a new `OutgoingResponse`.
pub fn make_response[A : ToBody](
  body : A,
  content_type~ : Bytes = b"text/plain",
  status_code~ : StatusCode = StatusCode::Ok
) -> @types.OutgoingResponse {
  let fields = @types.Fields::from_list([
    ("Content-Type", content_type.to_fixedarray()),
  ]).unwrap()
  let response = @types.OutgoingResponse::outgoing_response(fields)
  response
  .body()
  .unwrap()
  .write()
  .unwrap()
  .blocking_write_and_flush(body.to_body())
  .unwrap()
  response.set_status_code(status_code.to_statuscode()).unwrap()
  response
}
