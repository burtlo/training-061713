require 'faye'
# require File.expand_path('../app', __FILE__)

require './server'

Faye::WebSocket.load_adapter('thin')

use Faye::RackAdapter, mount: '/faye'
run Sinatra::Application