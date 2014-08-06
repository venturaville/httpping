#!/usr/bin/ruby
# Parallel HTTP Pinger
# httpping URL ...

require 'typhoeus'

TOTAL_TIME=60
INTERVAL_TIME=10

hydra = Typhoeus::Hydra.new

start = Time.now
((TOTAL_TIME/INTERVAL_TIME).to_i + 1).times do |i|
  tdiff = (Time.now - start).abs
  a = i * INTERVAL_TIME
  sleep((a - tdiff).abs) if tdiff < a
  puts Time.now
  requests = {}
  ARGV.each do |url|
    requests[url] = Typhoeus::Request.new(url)
    hydra.queue(requests[url])
  end
  hydra.run
  requests.each do |url,req|
    res = req.response
    puts "#{url}: #{res.total_time}"
  end
end

