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
