class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # this takes a hash of options, almost all of which map directly
	# to the familiar database.yml in rails
	# See http://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/MysqlAdapter.html
	client = Mysql2::Client.new(:host => "localhost", :username => "manamin0521")
	result = client.query("SELECT * from spots")
	puts = result
  protect_from_forgery with: :exception
end
