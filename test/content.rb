# rubocop:disable Metrics/LineLength
control 'content-homepage' do
  impact 1.0
  title 'Content completeness of homepage'

  describe http('http://127.0.0.1:1313', open_timeout: 60, read_timeout: 60) do
    its('body') { should include 'rss' }
    its('body') { should include 'link href="/index.xml"' }
    its('body') { should include '<link rel="stylesheet" href="/css/style.css">' }
    its('body') { should include 'href="/about"' }
    its('body') { should include 'href="/tags"' }
    its('body') { should include 'href="/index.xml"' }
  end
end

control 'content-pages' do
  impact 1.0
  title 'Content completeness of pages'

  describe http('http://127.0.0.1:1313/tags/', open_timeout: 60, read_timeout: 60) do
    its('body') { should include '<a href="/tags/' }
  end

  describe http('http://127.0.0.1:1313/about/', open_timeout: 60, read_timeout: 60) do
    its('body') { should match match %r{<h2.*>Bio.*</h2>} }
    its('body') { should match match %r{<h2.*>Contact.*</h2>} }
  end
end

control 'content-extras' do
  impact 1.0
  title 'Content completeness of extra downloads'

  describe http('http://127.0.0.1:1313/keybase.txt', open_timeout: 60, read_timeout: 60) do
    its('body') { should include 'I am an admin of https://hanneseichblatt.de' }
    its('body') { should include 'https://keybase.io/heichblatt' }
  end

  describe http('http://127.0.0.1:1313/pgp_keys.asc', open_timeout: 60, read_timeout: 60) do
    its('body') { should include '-----BEGIN PGP PUBLIC KEY BLOCK-----' }
  end
end

control 'content-rss' do
  impact 1.0
  title 'Content completeness of RSS feed'

  describe http('http://127.0.0.1:1313/index.xml', open_timeout: 60, read_timeout: 60) do
    its('body') { should match %r{<link>https?://.*/</link>} }
    its('body') { should include '<?xml version="1.0" encoding="utf-8" standalone="yes"?>' }
    its('body') { should include '<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">' }
    its('body') { should include '<title>Hannes Eichblatt</title>' }
    its('body') { should include '<generator>Hugo' }
    its('body') { should include '<item>' }
    its('body') { should include '</rss>' }
  end
end

control 'content-no-exposure' do
  impact 1.0
  title 'Check that no infrastructure files have been exposed'

  %w[Rakefile Makefile Dockerfile test/inspec.lock junit.xml].each do |file|
    describe http('http://127.0.0.1:1313/' + file, open_timeout: 60, read_timeout: 60) do
      its('status') { should eq 404 }
    end
  end
end
# rubocop:enable Metrics/LineLength
