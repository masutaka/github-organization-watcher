module WebmockHelper
  def stub_request_get(uri, response_body)
    WebMock.stub_request(:get, uri).to_return(
      status: 200, headers: { 'Content-Type' => 'application/json' },
      body: response_body
    )
  end
end
