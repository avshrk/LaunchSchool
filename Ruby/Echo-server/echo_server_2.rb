
require 'byebug'
require 'socket'

def parse_request(request_line)
  http_method, path_and_params, _ = request_line.split(' ')
  path, params = path_and_params.split('?')
  params = params.split('&').each_with_object({}) do |pair, hash|
    key, value = pair.split('=')
    hash[key] = value
  end
  [http_method, path, params ]
end

server = TCPServer.new('localhost',3003)

loop do
  client = server.accept
  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  # GET /?rolls=2&sides=6 HTTP/1.1
  # byebug
  puts request_line

  next if !request_line || request_line =~ /favicon/

  http_method, path, params = parse_request(request_line)

  rolls = params['rolls'].to_i
  sides= params['sides'].to_i

  client.puts 'HTTP/1.0 200 OK'
  client.puts 'Content-Type:text/html'
  client.puts ''
  client.puts '<html><body>'
  client.puts '<pre>'

  rolls.times do
    client.puts rand(sides) + 1
  end

  client.puts http_method
  client.puts path
  client.puts params
  client.puts request_line
  client.puts '</pre>'
  client.puts '</body></html>'

  client.close
end



