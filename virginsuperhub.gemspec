Gem::Specification.new do |s|
  s.name = 'virginsuperhub'
  s.version = '0.1.0'
  s.summary = 'Turns the WiFi on or off on a Virgin Media Super Hub 2.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/virginsuperhub.rb']
  s.signing_key = '../privatekeys/virginsuperhub.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/virginsuperhub'
end
