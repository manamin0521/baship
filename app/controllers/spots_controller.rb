class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  # GET /spots
  # GET /spots.json
  def index
      puts "index"
  end

  def genMap
      puts "緯度・経度を取得してアルゴリズムをかけてスコアが高い順に返す"
      params[:lat]
      params[:lng]
      # SQL
      require 'mysql2'

      client  = ActiveRecord::Base.connection

      # TODO: WHERE句の末尾の3を変更
      @results = client.select_rows("
        SELECT
          *,
          GLength(GeomFromText(CONCAT('LineString(139.0808219 35.1429357,', X(latlng), ' ', Y(latlng),')'))) * 112.12 / 5 As dist
        FROM spots
        WHERE
          GLength(GeomFromText(CONCAT('LineString(139.0808219 35.1429357,', X(latlng), ' ', Y(latlng),')'))) * 112.12 / 5 < 3
      ")

      # ビューに渡す値
      # @xxx = 123
      puts "-------" * 20
      p @results
      render :index
  end

  def spot
      puts "スポットの詳細表示"
      params[:spot_id]
      render :spot
  end

  def go
      puts "「行く」ボタンを押した後のページ"
      params[:lat]
      params[:lng]
      params[:spot_id]
      render :go
  end
end
