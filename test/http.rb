control 'http' do
  impact 1.0
  title 'Basic HTTP functionality'
  desc 'GET localhost:4000/, check various HTTP features'

  describe http('localhost:4000', open_timeout: 60, read_timeout: 60) do
    its('status') { should eq 200 }
    its('body') { should include 'hanneseichblatt.de' }
    its('headers.Server') { should include 'WEBrick' }
  end
end
