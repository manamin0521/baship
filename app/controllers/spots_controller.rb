class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  # GET /spots
  # GET /spots.json
  def index
    # @spots = Spot.all
    # params[:x]
    # params[:y]

    # SQL

    @xxx = 123

    puts "緯度・経度を取得して"
  end
end
