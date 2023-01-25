control 'http' do
  impact 1.0
  title 'Basic HTTP functionality'
  desc 'GET localhost:1313/, check various HTTP features'

  describe http('http://127.0.0.1:1313', open_timeout: 60, read_timeout: 60) do
    its('status') { should eq 200 }
    its('body') { should include 'Hannes Eichblatt' }
  end
end
