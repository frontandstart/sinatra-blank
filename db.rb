require 'active_record'
require 'sqlite3'
#require 'mysql2'
#require 'pg'
require 'yaml'

@env = 'development'
@config = YAML.load(File.read('./config/database.yml'))

ActiveRecord::Base.establish_connection @config[@env]
ActiveRecord::Base.include_root_in_json = false

# Describe your model here
class Model < ActiveRecord::Base

end
