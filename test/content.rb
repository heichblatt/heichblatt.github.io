# rubocop:disable Metrics/LineLength
control 'content-homepage' do
  impact 1.0
  title 'Content completeness of homepage'

  describe http('localhost:4000', open_timeout: 60, read_timeout: 60) do
    its('body') { should include 'RSS' }
    its('body') { should include 'link href="/atom.xml"' }
    its('body') { should include 'link rel="stylesheet" href="/assets/themes/thomas/css/syntax.css"' }
    its('body') { should include 'link rel="stylesheet" href="/assets/themes/thomas/css/screen.css"' }
    its('body') { should include 'href="/about.html"' }
    its('body') { should include 'href="/pages.html"' }
    its('body') { should include 'href="/tags.html"' }
    its('body') { should include 'href="/contact.html"' }
    its('body') { should include 'href="/feed.xml"' }
    its('body') { should include 'Posts' }
    its('body') { should include 'github.com/heichblatt' }
    its('body') { should include 'twitter.com/heichblatt' }
  end
end

control 'content-pages' do
  impact 1.0
  title 'Content completeness of pages'

  describe http('localhost:4000/about.html', open_timeout: 60, read_timeout: 60) do
    its('body') { should include '<h1>About</h1>' }
  end

  describe http('localhost:4000/pages.html', open_timeout: 60, read_timeout: 60) do
    its('body') { should include '<h1>Pages</h1>' }
  end

  describe http('localhost:4000/tags.html', open_timeout: 60, read_timeout: 60) do
    its('body') { should include '<h1>Tags</h1>' }
  end

  describe http('localhost:4000/contact.html', open_timeout: 60, read_timeout: 60) do
    its('body') { should include '<h1>Contact</h1>' }
  end

  describe http('localhost:4000/about.html', open_timeout: 60, read_timeout: 60) do
    its('body') { should include '<h1>About</h1>' }
  end
end

control 'content-extras' do
  impact 1.0
  title 'Content completeness of extra downloads'

  describe http('localhost:4000/keybase.txt', open_timeout: 60, read_timeout: 60) do
    its('body') { should include 'I am an admin of https://www.hanneseichblatt.de' }
    its('body') { should include 'https://keybase.io/heichblatt' }
  end
end

control 'content-rss' do
  impact 1.0
  title 'Content completeness of RSS feed'

  describe http('localhost:4000/feed.xml', open_timeout: 60, read_timeout: 60) do
    its('body') { should match %r{<link>https?://.*/</link>} }
    its('body') { should include '<?xml version="1.0" encoding="UTF-8"?>' }
    its('body') { should include '<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">' }
    its('body') { should include '<title>hanneseichblatt.de</title>' }
    its('body') { should match %r{<atom:link href="http://.*:4000/feed.xml" rel="self" type="application/rss\+xml"/>} }
    its('body') { should include '<generator>Jekyll' }
    its('body') { should include '<item>' }
    its('body') { should include '<category>' }
    its('body') { should include '</rss>' }
  end
end

control 'content-no-exposure' do
  impact 1.0
  title 'Check that no infrastructure files have been exposed'

  %w[Rakefile Makefile Dockerfile test/inspec.lock].each do |file|
    describe http('localhost:4000/' + file, open_timeout: 60, read_timeout: 60) do
      its('status') { should eq 404 }
    end
  end
end
# rubocop:enable Metrics/LineLength
