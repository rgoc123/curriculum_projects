require 'rack'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  
  res_text = req.fullpath
  res['Content-Type'] = 'text/html'
  
  res.write(res_text)
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)