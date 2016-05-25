Her::API.setup url: ENV['DEPARTMENT_SERVICE_URL'], ssl: { ca_path: '/usr/lib/ssl/certs' } do |c|
  # Request
  c.use Faraday::Request::UrlEncoded

  # Response
  c.use Her::Middleware::DefaultParseJSON

  # Adapter
  c.use Faraday::Adapter::NetHttp
end
