trait ToBody {
  to_body(Self) -> FixedArray[Byte]
}

pub impl ToBody for FixedArray[Byte] with
  to_body(self: FixedArray[Byte]) -> FixedArray[Byte] {
    self
  }

pub impl ToBody for Bytes with 
  to_body(self: Bytes) -> FixedArray[Byte] {
    self.to_fixedarray()
  }

pub impl ToBody for String with 
  to_body(self: String) -> FixedArray[Byte] {
    self.to_bytes().to_body()
  }

///|
/// Converts a JSON-serializable value to a byte array representation.
///
/// Parameters:
///
/// * `json` : A value of any type that implements the `ToJson` trait.
///
/// Returns a fixed-size array of bytes containing the JSON string representation
/// of the input value.
pub fn json_to_bytes[A: ToJson](json: A) -> FixedArray[Byte] {
  json.to_json().to_string().to_body()
}

///| `make_response` makes a new `OutgoingResponse`.
pub fn make_response[A: ToBody](
  body : A,
  content_type~ : String = "text/plain",
  status_code~ : StatusCode = Ok
) -> @types.OutgoingResponse {
  let fields = @types.Fields::from_list([
    ("Content-Type", content_type.to_body()),
  ]).unwrap()
  let response = 
    @types.OutgoingResponse::outgoing_response(fields)
  response
  .body()
  .unwrap()
  .write()
  .unwrap()
  .blocking_write_and_flush(body.to_body())
  .unwrap()
  response
    .set_status_code(status_code.to_statuscode()).unwrap()
  response
}
