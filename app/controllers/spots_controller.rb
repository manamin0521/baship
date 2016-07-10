class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  # GET /spots
  # GET /spots.json
  def index
      puts "index"
  end

  def gemMap
      puts "緯度・経度を取得してアルゴリズムをかけてスコアが高い順に返す"
      params[:lat]
      params[:lng]
      # SQL

      # ビューに渡す値
      # @xxx = 123
      render :index
  end

  def spot
      # puts "スポットの詳細表示"
      # params[:spot_id]
      require 'mysql2'

      client  = Mysql2::Client.new(:host => "localhost", :username => "root", :database => 'bashit_db')
      @spot   = client.query("SELECT * FROM spots WHERE id = #{params[:spot_id]}").first
      render :spot
  end

  def go
      # 行く」ボタンを押した後のページ
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

      render :go
  end
end
