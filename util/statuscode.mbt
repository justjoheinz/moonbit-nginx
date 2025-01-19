// create an enum of status codes
// in accordance to https://de.wikipedia.org/wiki/HTTP-Statuscode
///|
/// Represents HTTP status codes as defined in RFC 2616 and its successors.
///
/// The enum is divided into five categories:
///
/// * 1xx (Informational): Server has received the request and is continuing the
/// process
/// * 2xx (Success): Request was successfully received, understood, and accepted
/// * 3xx (Redirection): Further action needs to be taken to complete the request
/// * 4xx (Client Error): Request contains bad syntax or cannot be fulfilled
/// * 5xx (Server Error): Server failed to fulfill a valid request
///
/// Each variant corresponds to a standard HTTP status code and can be converted
/// to its numeric value using `to_statuscode()` or created from a numeric value
/// using `from_code()` or `from_code_or_error!()`.
pub(all) enum StatusCode {
  // 1xx Informational
  Continue
  SwitchingProtocols
  Processing
  EarlyHints
  // 2xx Success
  Ok
  Created
  Accepted
  NonAuthoritativeInformation
  NoContent
  ResetContent
  PartialContent
  MultiStatus
  AlreadyReported
  IMUsed
  // 3xx Redirection
  MultipleChoices
  MovedPermanently
  Found
  SeeOther
  NotModified
  UseProxy
  SwitchProxy
  TemporaryRedirect
  PermanentRedirect
  // 4xx Client Error
  BadRequest
  Unauthorized
  PaymentRequired
  Forbidden
  NotFound
  MethodNotAllowed
  NotAcceptable
  ProxyAuthenticationRequired
  RequestTimeout
  Conflict
  Gone
  LengthRequired
  PreconditionFailed
  PayloadTooLarge
  URITooLong
  UnsupportedMediaType
  RangeNotSatisfiable
  ExpectationFailed
  ImATeapot
  MisdirectedRequest
  UnprocessableEntity
  Locked
  FailedDependency
  TooEarly
  UpgradeRequired
  PreconditionRequired
  TooManyRequests
  RequestHeaderFieldsTooLarge
  UnavailableForLegalReasons
  // 5xx Server Error
  InternalServerError
  NotImplemented
  BadGateway
  ServiceUnavailable
  GatewayTimeout
  HTTPVersionNotSupported
  VariantAlsoNegotiates
  InsufficientStorage
  LoopDetected
  NotExtended
  NetworkAuthenticationRequired
} derive(Eq, Show)

///|
/// Converts a `StatusCode` enum variant to its corresponding numeric HTTP status
/// code value.
///
/// Parameters:
///
/// * `status` : The `StatusCode` enum variant to convert.
///
/// Returns an unsigned integer representing the HTTP status code (between 100
/// and 511).
pub fn to_statuscode(self : StatusCode) -> UInt {
  match self {
    // 1xx
    StatusCode::Continue => 100
    StatusCode::SwitchingProtocols => 101
    StatusCode::Processing => 102
    StatusCode::EarlyHints => 103
    // 2xx
    StatusCode::Ok => 200
    StatusCode::Created => 201
    StatusCode::Accepted => 202
    StatusCode::NonAuthoritativeInformation => 203
    StatusCode::NoContent => 204
    StatusCode::ResetContent => 205
    StatusCode::PartialContent => 206
    StatusCode::MultiStatus => 207
    StatusCode::AlreadyReported => 208
    StatusCode::IMUsed => 226
    // 3xx
    StatusCode::MultipleChoices => 300
    StatusCode::MovedPermanently => 301
    StatusCode::Found => 302
    StatusCode::SeeOther => 303
    StatusCode::NotModified => 304
    StatusCode::UseProxy => 305
    StatusCode::SwitchProxy => 306
    StatusCode::TemporaryRedirect => 307
    StatusCode::PermanentRedirect => 308
    // 4xx
    StatusCode::BadRequest => 400
    StatusCode::Unauthorized => 401
    StatusCode::PaymentRequired => 402
    StatusCode::Forbidden => 403
    StatusCode::NotFound => 404
    StatusCode::MethodNotAllowed => 405
    StatusCode::NotAcceptable => 406
    StatusCode::ProxyAuthenticationRequired => 407
    StatusCode::RequestTimeout => 408
    StatusCode::Conflict => 409
    StatusCode::Gone => 410
    StatusCode::LengthRequired => 411
    StatusCode::PreconditionFailed => 412
    StatusCode::PayloadTooLarge => 413
    StatusCode::URITooLong => 414
    StatusCode::UnsupportedMediaType => 415
    StatusCode::RangeNotSatisfiable => 416
    StatusCode::ExpectationFailed => 417
    StatusCode::ImATeapot => 418
    StatusCode::MisdirectedRequest => 421
    StatusCode::UnprocessableEntity => 422
    StatusCode::Locked => 423
    StatusCode::FailedDependency => 424
    StatusCode::TooEarly => 425
    StatusCode::UpgradeRequired => 426
    StatusCode::PreconditionRequired => 428
    StatusCode::TooManyRequests => 429
    StatusCode::RequestHeaderFieldsTooLarge => 431
    StatusCode::UnavailableForLegalReasons => 451
    StatusCode::InternalServerError => 500
    StatusCode::NotImplemented => 501
    StatusCode::BadGateway => 502
    StatusCode::ServiceUnavailable => 503
    StatusCode::GatewayTimeout => 504
    StatusCode::HTTPVersionNotSupported => 505
    StatusCode::VariantAlsoNegotiates => 506
    StatusCode::InsufficientStorage => 507
    StatusCode::LoopDetected => 508
    StatusCode::NotExtended => 510
    StatusCode::NetworkAuthenticationRequired => 511
  }
}

test "to_statuscode/1xx" {
  inspect!(to_statuscode(Continue), content="100")
  inspect!(to_statuscode(SwitchingProtocols), content="101")
  inspect!(to_statuscode(Processing), content="102")
  inspect!(to_statuscode(EarlyHints), content="103")
}

test "to_statuscode/2xx" {
  inspect!(to_statuscode(Ok), content="200")
  inspect!(to_statuscode(Created), content="201")
  inspect!(to_statuscode(NoContent), content="204")
}

test "to_statuscode/errors" {
  inspect!(to_statuscode(BadRequest), content="400")
  inspect!(to_statuscode(NotFound), content="404")
  inspect!(to_statuscode(InternalServerError), content="500")
  inspect!(to_statuscode(BadGateway), content="502")
}

///|
/// Represents an error that occurs when an unrecognized HTTP status code is
/// encountered.
///
/// Parameters:
///
/// * `code` : The invalid HTTP status code that caused the error.
type! UnknownStatusCode UInt

///|
/// Converts a numeric HTTP status code to its corresponding `StatusCode` enum
/// variant. Acts as the inverse operation of `to_statuscode`.
///
/// Parameters:
///
/// * `code` : An unsigned integer representing the HTTP status code to convert.
/// Valid status codes range from 100 to 511, covering all standard HTTP response
/// status codes.
///
/// Returns a `Result` type containing either:
///
/// * `Ok(StatusCode)` with the corresponding `StatusCode` enum variant if the
/// code is valid
/// * `Err(UnknownStatusCode)` if the given code is not a recognized HTTP status
/// code
///
pub fn StatusCode::from_code(
  code : UInt
) -> Result[StatusCode, UnknownStatusCode] {
  match code {
    // 1xx
    100 => Ok(Continue)
    101 => Ok(SwitchingProtocols)
    102 => Ok(Processing)
    103 => Ok(EarlyHints)
    // 2xx
    200 => Ok(Ok)
    201 => Ok(Created)
    202 => Ok(Accepted)
    203 => Ok(NonAuthoritativeInformation)
    204 => Ok(NoContent)
    205 => Ok(ResetContent)
    206 => Ok(PartialContent)
    207 => Ok(MultiStatus)
    208 => Ok(AlreadyReported)
    226 => Ok(IMUsed)
    // 3xx
    300 => Ok(MultipleChoices)
    301 => Ok(MovedPermanently)
    302 => Ok(Found)
    303 => Ok(SeeOther)
    304 => Ok(NotModified)
    306 => Ok(SwitchProxy)
    307 => Ok(TemporaryRedirect)
    308 => Ok(PermanentRedirect)
    // 4xx
    400 => Ok(BadRequest)
    401 => Ok(Unauthorized)
    402 => Ok(PaymentRequired)
    403 => Ok(Forbidden)
    404 => Ok(NotFound)
    405 => Ok(MethodNotAllowed)
    406 => Ok(NotAcceptable)
    407 => Ok(ProxyAuthenticationRequired)
    408 => Ok(RequestTimeout)
    409 => Ok(Conflict)
    410 => Ok(Gone)
    411 => Ok(LengthRequired)
    412 => Ok(PreconditionFailed)
    413 => Ok(PayloadTooLarge)
    414 => Ok(URITooLong)
    415 => Ok(UnsupportedMediaType)
    416 => Ok(RangeNotSatisfiable)
    417 => Ok(ExpectationFailed)
    418 => Ok(ImATeapot)
    421 => Ok(MisdirectedRequest)
    422 => Ok(UnprocessableEntity)
    423 => Ok(Locked)
    424 => Ok(FailedDependency)
    425 => Ok(TooEarly)
    426 => Ok(UpgradeRequired)
    428 => Ok(PreconditionRequired)
    429 => Ok(TooManyRequests)
    431 => Ok(RequestHeaderFieldsTooLarge)
    451 => Ok(UnavailableForLegalReasons)
    // 5xx
    500 => Ok(InternalServerError)
    501 => Ok(NotImplemented)
    502 => Ok(BadGateway)
    503 => Ok(ServiceUnavailable)
    504 => Ok(GatewayTimeout)
    505 => Ok(HTTPVersionNotSupported)
    506 => Ok(VariantAlsoNegotiates)
    507 => Ok(InsufficientStorage)
    508 => Ok(LoopDetected)
    510 => Ok(NotExtended)
    511 => Ok(NetworkAuthenticationRequired)
    _ => Err(UnknownStatusCode(code))
  }
}

///|
/// Converts a numeric HTTP status code to a `StatusCode` enum value. Raises an
/// error if the code is not recognized.
///
/// Parameters:
///
/// * `code` : The numeric HTTP status code to convert (between 100 and 511).
///
/// Returns a `StatusCode` enum value corresponding to the numeric code.
///
/// Throws an error of type `UnknownStatusCode` if the given code is not a valid
/// HTTP status code.
///
/// ```
pub fn StatusCode::from_code_or_error(
  code : UInt
) -> StatusCode!UnknownStatusCode {
  let result = StatusCode::from_code(code)
  result.unwrap_or_error!()
}

test "StatusCode::from_code_or_error/success" {
  inspect!(StatusCode::from_code_or_error!(200), content="Ok")
  inspect!(StatusCode::from_code_or_error!(404), content="NotFound")
  inspect!(StatusCode::from_code_or_error!(500), content="InternalServerError")
}

test "panic StatusCode::from_code_or_error/invalid" {
  ignore(StatusCode::from_code_or_error!(999))
}

test "StatusCode::from_code_or_error/boundary" {
  inspect!(StatusCode::from_code_or_error!(100), content="Continue")
  inspect!(
    StatusCode::from_code_or_error!(511),
    content="NetworkAuthenticationRequired",
  )
}
