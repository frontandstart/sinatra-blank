set :user, 'linuxusername'
server 'car', user: "#{fetch :user}", roles: %w{app db web}