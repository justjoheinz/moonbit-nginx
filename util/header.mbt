///|
pub(all) enum HeaderKey {
  // Authentication
  WWW_Authenticate
  Authorization
  Proxy_Authenticate
  Proxy_Authorization
  // Caching
  Age
  Cache_Control
  Clear_Site_Data
  Expires
  No_Vary_Search
  // Conditionals 
  Last_Modified
  ETag
  If_Match
  If_None_Match
  If_Modified_Since
  If_Unmodified_Since
  Vary
  // Connection management
  Connection
  Keep_Alive
  // Content negotiation
  Accept
  Accept_Encoding
  Accept_Patch
  Accept_Post
  // Controls
  Expect
  Max_Forwards
  // Cookies
  Cookie
  Set_Cookie
  // CORS
  Access_Control_Allow_Credentials
  Access_Control_Allow_Headers
  Access_Control_Allow_Methods
  Access_Control_Allow_Origin
  Access_Control_Expose_Headers
  Access_Control_Max_Age
  Access_Control_Request_Headers
  Access_Control_Request_Method
  Origin
  Timing_Allow_Origin
  // Downloads 
  Content_Disposition
  // Integrity digests
  Content_Digest
  Repr_Digest
  Want_Content_Digest
  Want_Repr_Digest
  // Message body information
  Content_Length
  Content_Type
  Content_Encoding
  Content_Language
  Content_Location
  // Proxies
  Forwarded
  Via
  // Range requests
  Accept_Ranges
  Range
  If_Range
  Content_Range
  // Redirection
  Location
  Refresh
  // Request context
  From
  Host
  Referer
  Referer_Policy
  User_Agent
  // Response context
  Allow
  Server
  // Security 
  Cross_Origin_Embedder_Policy
  Cross_Origin_Opener_Policy
  Cross_Origin_Resource_Policy
  Content_Security_Policy
  Content_Security_Policy_Report_Only
  Expect_CT
  Permissions_Policy
  Reporting_Endpoints
  Strict_Transport_Security
  Upgrade_Insecure_Requests
  X_Content_Type_Options
  X_Frame_Options
  X_Permitted_Cross_Domain_Policies
  X_Powered_By
  X_XSS_Protection
  // Fetch metadata request headers
  Sec_Fetch_Site
  Sec_Fetch_Mode
  Sec_Fetch_User
  Sec_Fetch_Dest
  Sec_Fetch_Purpose
  Service_Worker_Navigation_Preload
  // Server Sent Events 
  TE
  Trailer
  // WebSockets
  Sec_WebSocket_Accept
  Sec_Websocket_Extenstions
  Sec_WebSocket_Key
  Sec_WebSocket_Protocol
  Sec_WebSocket_Version
  // Other
  Alt_Svc
  Alt_Used
  Date
  Link
  Retry_After
  Server_Timing
  Service_Worker
  Serice_Worker_Allowed
  SourceMap
  Upgrade
  Priority
} derive(Eq, Show)

///|
pub impl Show for HeaderKey with to_string(self : HeaderKey) -> String {
  match self {
    HeaderKey::WWW_Authenticate => "WWW-Authenticate"
    HeaderKey::Authorization => "Authorization"
    HeaderKey::Proxy_Authenticate => "Proxy-Authenticate"
    HeaderKey::Proxy_Authorization => "Proxy-Authorization"
    HeaderKey::Age => "Age"
    HeaderKey::Cache_Control => "Cache-Control"
    HeaderKey::Clear_Site_Data => "Clear-Site-Data"
    HeaderKey::Expires => "Expires"
    HeaderKey::No_Vary_Search => "No-Vary-Search"
    HeaderKey::Last_Modified => "Last-Modified"
    HeaderKey::ETag => "ETag"
    HeaderKey::If_Match => "If-Match"
    HeaderKey::If_None_Match => "If-None-Match"
    HeaderKey::If_Modified_Since => "If-Modified-Since"
    HeaderKey::If_Unmodified_Since => "If-Unmodified-Since"
    HeaderKey::Vary => "Vary"
    HeaderKey::Connection => "Connection"
    HeaderKey::Keep_Alive => "Keep-Alive"
    HeaderKey::Accept => "Accept"
    HeaderKey::Accept_Encoding => "Accept-Encoding"
    HeaderKey::Accept_Patch => "Accept-Patch"
    HeaderKey::Accept_Post => "Accept-Post"
    HeaderKey::Expect => "Expect"
    HeaderKey::Max_Forwards => "Max-Forwards"
    HeaderKey::Cookie => "Cookie"
    HeaderKey::Set_Cookie => "Set-Cookie"
    HeaderKey::Access_Control_Allow_Credentials =>
      "Access-Control-Allow-Credentials"
    HeaderKey::Access_Control_Allow_Headers => "Access-Control-Allow-Headers"
    HeaderKey::Access_Control_Allow_Methods => "Access-Control-Allow-Methods"
    HeaderKey::Access_Control_Allow_Origin => "Access-Control-Allow-Origin"
    HeaderKey::Access_Control_Expose_Headers => "Access-Control-Expose-Headers"
    HeaderKey::Access_Control_Max_Age => "Access-Control-Max-Age"
    HeaderKey::Access_Control_Request_Headers =>
      "Access-Control-Request-Headers"
    HeaderKey::Access_Control_Request_Method => "Access-Control-Request-Method"
    HeaderKey::Origin => "Origin"
    HeaderKey::Timing_Allow_Origin => "Timing-Allow-Origin"
    HeaderKey::Content_Disposition => "Content-Disposition"
    HeaderKey::Content_Digest => "Content-Digest"
    HeaderKey::Repr_Digest => "Repr-Digest"
    HeaderKey::Want_Content_Digest => "Want-Content-Digest"
    HeaderKey::Want_Repr_Digest => "Want-Repr-Digest"
    HeaderKey::Content_Length => "Content-Length"
    HeaderKey::Content_Type => "Content-Type"
    HeaderKey::Content_Encoding => "Content-Encoding"
    HeaderKey::Content_Language => "Content-Language"
    HeaderKey::Content_Location => "Content-Location"
    HeaderKey::Forwarded => "Forwarded"
    HeaderKey::Via => "Via"
    HeaderKey::Accept_Ranges => "Accept-Ranges"
    HeaderKey::Range => "Range"
    HeaderKey::If_Range => "If-Range"
    HeaderKey::Content_Range => "Content-Range"
    HeaderKey::Location => "Location"
    HeaderKey::Refresh => "Refresh"
    HeaderKey::From => "From"
    HeaderKey::Host => "Host"
    HeaderKey::Referer => "Referer"
    HeaderKey::Referer_Policy => "Referer-Policy"
    HeaderKey::User_Agent => "User-Agent"
    HeaderKey::Allow => "Allow"
    HeaderKey::Server => "Server"
    HeaderKey::Cross_Origin_Embedder_Policy => "Cross-Origin-Embedder-Policy"
    HeaderKey::Cross_Origin_Opener_Policy => "Cross-Origin-Opener-Policy"
    HeaderKey::Cross_Origin_Resource_Policy => "Cross-Origin-Resource-Policy"
    HeaderKey::Content_Security_Policy => "Content-Security-Policy"
    HeaderKey::Content_Security_Policy_Report_Only =>
      "Content-Security-Policy-Report-Only"
    HeaderKey::Expect_CT => "Expect-CT"
    HeaderKey::Permissions_Policy => "Permissions-Policy"
    HeaderKey::Reporting_Endpoints => "Reporting-Endpoints"
    HeaderKey::Strict_Transport_Security => "Strict-Transport-Security"
    HeaderKey::Upgrade_Insecure_Requests => "Upgrade-Insecure-Requests"
    HeaderKey::X_Content_Type_Options => "X-Content-Type-Options"
    HeaderKey::X_Frame_Options => "X-Frame-Options"
    HeaderKey::X_Permitted_Cross_Domain_Policies =>
      "X-Permitted-Cross-Domain-Policies"
    HeaderKey::X_Powered_By => "X-Powered-By"
    HeaderKey::X_XSS_Protection => "X-XSS-Protection"
    HeaderKey::Sec_Fetch_Site => "Sec-Fetch-Site"
    HeaderKey::Sec_Fetch_Mode => "Sec-Fetch-Mode"
    HeaderKey::Sec_Fetch_User => "Sec-Fetch-User"
    HeaderKey::Sec_Fetch_Dest => "Sec-Fetch-Dest"
    HeaderKey::Sec_Fetch_Purpose => "Sec-Fetch-Purpose"
    HeaderKey::Service_Worker_Navigation_Preload =>
      "Service-Worker-Navigation-Preload"
    HeaderKey::TE => "TE"
    HeaderKey::Trailer => "Trailer"
    HeaderKey::Sec_WebSocket_Accept => "Sec-WebSocket-Accept"
    HeaderKey::Sec_Websocket_Extenstions => "Sec-Websocket-Extenstions"
    HeaderKey::Sec_WebSocket_Key => "Sec-WebSocket-Key"
    HeaderKey::Sec_WebSocket_Protocol => "Sec-WebSocket-Protocol"
    HeaderKey::Sec_WebSocket_Version => "Sec-WebSocket-Version"
    HeaderKey::Alt_Svc => "Alt-Svc"
    HeaderKey::Alt_Used => "Alt-Used"
    HeaderKey::Date => "Date"
    HeaderKey::Link => "Link"
    HeaderKey::Retry_After => "Retry-After"
    HeaderKey::Server_Timing => "Server-Timing"
    HeaderKey::Service_Worker => "Service-Worker"
    HeaderKey::Serice_Worker_Allowed => "Serice-Worker-Allowed"
    HeaderKey::SourceMap => "SourceMap"
    HeaderKey::Upgrade => "Upgrade"
    HeaderKey::Priority => "Priority"
  }
}
