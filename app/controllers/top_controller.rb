class TopController < ApplicationController
  def index
    require 'mysql2'

    client = Mysql2::Client.new(:host => "localhost", :username => "root", :database => 'db_development')

    @results = client.query("SELECT * FROM spots")
  end

  def show
  end
end
