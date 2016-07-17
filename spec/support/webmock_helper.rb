module WebmockHelper
  def webmock_get(url, response_body)
    WebMock.stub_request(:get, url).to_return(
      status: 200, headers: { 'Content-Type' => 'application/json' },
      body: response_body
    )
  end
end
