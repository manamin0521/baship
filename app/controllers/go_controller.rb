class GoController < ApplicationController
  def index
    require 'mysql2'

    seasons = [4, 4, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4]

    spot_id = params[:spot_id]
    lat     = params[:lat]
    lng     = params[:lng]
    weather = 1
    group   = 1
    season  = seasons[Date.today.month - 1]

    client  = Mysql2::Client.new(:host => "localhost", :username => "root", :database => 'bashit_db')
    client.query("INSERT INTO visit_logs (spot_id, weather, group_kind, season, latlng) VALUES (#{spot_id}, #{weather}, #{group}, #{season}, Point(#{lat}, #{lng}))")

    @latlng = client.query("SELECT X(latlng) as lng, Y(latlng) as lat from spots where id = #{spot_id}");
  end
end
