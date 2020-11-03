server '167.99.130.142', user: fetch(:user).to_s, roles: %w(app db web), primary: true
set :nginx_server_name, 'study-nginx.ddns.net'

set :environment, 'production'