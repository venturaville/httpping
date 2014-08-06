Gem::Specification.new do |s|
  s.name = "httpping"
  s.version = "1.0.0"
  s.license = 'MIT'
  s.email = "david-vv@nicklay.com"
  s.homepage = "https://github.com/venturaville/httpping"
  s.authors = ["David Nicklay"]
  s.summary = "HTTP Parallel Pinger"
  s.files = Dir['bin/*']
  s.description = "HTTP Parallel Pinger"
  s.bindir = "bin"
  s.executables = %w{ httpping }
  %w{ typhoeus }.each do |d|
    s.add_dependency d
  end
end
