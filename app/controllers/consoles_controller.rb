class ConsolesController < ApplicationController
  before_action :set_console, only: %i[ show edit update destroy ]
  before_action :set_console_type_query, only: %i[ show edit update create new ] 
  
  # GET /consoles or /consoles.json
  def index
    @consoles = Console.all
  end

  # GET /consoles/1 or /consoles/1.json
  def show
  end

  # GET /consoles/new
  def new
    @console = Console.new
  end

  # GET /consoles/1/edit
  def edit
  end

  # POST /consoles or /consoles.json
  def create
    @console = Console.new(console_params)

    respond_to do |format|
      if @console.save
        format.html { redirect_to @console, notice: "Console was successfully created." }
        format.json { render :show, status: :created, location: @console }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @console.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consoles/1 or /consoles/1.json
  def update
    respond_to do |format|
      if @console.update(console_params)
        format.html { redirect_to @console, notice: "Console was successfully updated." }
        format.json { render :show, status: :ok, location: @console }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @console.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consoles/1 or /consoles/1.json
  def destroy
    @console.destroy
    respond_to do |format|
      format.html { redirect_to consoles_url, notice: "Console was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_console_type_query
     @console_type_query = ConsoleType.all.pluck(:description, :id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_console
      @console = Console.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def console_params
      params.require(:console).permit(:description, :id, :acronym, :url_image, :console_type_id)
    end
end
