class ConsoleTypesController < ApplicationController
  before_action :set_console_type, only: %i[ show edit update destroy ]

  # GET /console_types or /console_types.json
  def index
    @console_types = ConsoleType.all
  end

  # GET /console_types/1 or /console_types/1.json
  def show
  end

  # GET /console_types/new
  def new
    @console_type = ConsoleType.new
  end

  # GET /console_types/1/edit
  def edit
  end

  # POST /console_types or /console_types.json
  def create
    @console_type = ConsoleType.new(console_type_params)

    respond_to do |format|
      if @console_type.save
        format.html { redirect_to @console_type, notice: "Console type was successfully created." }
        format.json { render :show, status: :created, location: @console_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @console_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /console_types/1 or /console_types/1.json
  def update
    respond_to do |format|
      if @console_type.update(console_type_params)
        format.html { redirect_to @console_type, notice: "Console type was successfully updated." }
        format.json { render :show, status: :ok, location: @console_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @console_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /console_types/1 or /console_types/1.json
  def destroy
    @console_type.destroy
    respond_to do |format|
      format.html { redirect_to console_types_url, notice: "Console type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_console_type
      @console_type = ConsoleType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def console_type_params
      params.require(:console_type).permit(:description, :acronym, :url_image, :console_type_id)
    end
end
