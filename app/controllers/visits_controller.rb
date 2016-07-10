class VisitsController < ApplicationController
  def count
    require 'mysql2'

    client  = Mysql2::Client.new(:host => "localhost", :username => "root", :database => 'bashit_db')

    seasons = [4, 4, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4]

    @results = client.query("SELECT spot_id, count(*) As visits FROM vist_log WHERE season = #{seasons[Date.today.month - 1]} GROUP BY spot_id")
  end
end
