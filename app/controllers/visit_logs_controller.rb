class VisitLogsController < ApplicationController
  before_action :set_visit_log, only: [:show, :edit, :update, :destroy]

  # GET /visit_logs
  # GET /visit_logs.json
  def index
    @visit_logs = VisitLog.all
  end

  # GET /visit_logs/1
  # GET /visit_logs/1.json
  def show
  end

  # GET /visit_logs/new
  def new
    @visit_log = VisitLog.new
  end

  # GET /visit_logs/1/edit
  def edit
  end

  # POST /visit_logs
  # POST /visit_logs.json
  def create
    @visit_log = VisitLog.new(visit_log_params)

    respond_to do |format|
      if @visit_log.save
        format.html { redirect_to @visit_log, notice: 'Visit log was successfully created.' }
        format.json { render :show, status: :created, location: @visit_log }
      else
        format.html { render :new }
        format.json { render json: @visit_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visit_logs/1
  # PATCH/PUT /visit_logs/1.json
  def update
    respond_to do |format|
      if @visit_log.update(visit_log_params)
        format.html { redirect_to @visit_log, notice: 'Visit log was successfully updated.' }
        format.json { render :show, status: :ok, location: @visit_log }
      else
        format.html { render :edit }
        format.json { render json: @visit_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visit_logs/1
  # DELETE /visit_logs/1.json
  def destroy
    @visit_log.destroy
    respond_to do |format|
      format.html { redirect_to visit_logs_url, notice: 'Visit log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit_log
      @visit_log = VisitLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_log_params
      params.require(:visit_log).permit(:spot_id, :weather, :group_kind, :integer, :season, :integer)
    end
end
