require "sinatra"
require "sinatra/namespace"
# require 'thin'
require "puma"
require 'oj'
require 'mongoid'

# All routes are combined in controller files
# All helpers are registed here
Dir.glob('./helpers/*.rb').each { |h| require_relative h }
Dir.glob('./model/*.rb').each { |m| require_relative m }
Dir.glob('./workers/*.rb').each { |w| require_relative w }
Dir.glob('./controllers/*.rb').each { |c| require_relative c }

# Command for reload models in console
def rel!
  Dir.glob('./models/*.rb').each { |m| load m }
  Dir.glob('./workers/*.rb').each { |w| load w }
  puts '##All models reloaded!##'
end


# require_relative './robot.rb'
# require_relative './helpers/api_helpers.rb'
# require_relative './model/comment_model.rb'
# require_relative './controllers/comment_controller.rb'
# require_relative './model/label_model.rb'
# require_relative './controllers/label_controller.rb'
# require_relative './model/parrot_model.rb'
# require_relative './controllers/parrot_controller.rb'
# require_relative './controllers/robot_controller.rb'
# require_relative './model/post_model.rb'
# require_relative './controllers/post_controller.rb'
Mongoid.load!("./config/mongodb.yml", :development)
