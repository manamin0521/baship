class TopController < ApplicationController
  def index
    require 'mysql2'

    client  = Mysql2::Client.new(:host => "localhost", :username => "root", :database => 'bashit_db')

    # TODO: WHERE句の末尾の3を変更
    @results = client.query("
      SELECT
        *,
        GLength(GeomFromText(CONCAT('LineString(139.0808219 35.1429357,', X(latlng), ' ', Y(latlng),')'))) * 112.12 / 5 As dist
      FROM spots
      WHERE
        GLength(GeomFromText(CONCAT('LineString(139.0808219 35.1429357,', X(latlng), ' ', Y(latlng),')'))) * 112.12 / 5 < 3
    ")
  end

  def show
  end
end
