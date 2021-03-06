require 'webrick'

def start_server(router)

  server = WEBrick::HTTPServer.new(Port: 80)
  server.mount_proc('/') do |req, res|
    route = router.run(req, res)
  end

  trap('INT') { server.shutdown }

  server.start
end
