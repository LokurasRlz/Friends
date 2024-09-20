class ToolsController < ApplicationController
  before_action :set_tool, only: %i[show edit update destroy reset_date_of_use reset_date_of_use]
  before_action :authenticate_user!, except: %i[show index update show reset_date_of_use update_date_of_use]
 

  # GET /tools or /tools.json
  def index
    if params[:search]
      search_term = "%#{params[:search]}%"
      @tools = Tool.where("id_tool ILIKE ? OR precinto ILIKE ? OR clase ILIKE ?", search_term, search_term, search_term)
    else
      @tools = Tool.all
    end
  end

  def used_tools
    # Fetch tools that have a date of use (i.e., tools that have been used)
    @tools = Tool.where.not(date_of_use: nil)
    
    render :index  # Reuse the index view to display the filtered tools
  end


  # GET /tools/1 or /tools/1.json
  def show
  end

  # GET /tools/new
  def new
    @tool = current_user.tools.build
  end

  # GET /tools/1/edit
  def edit
  end

  # POST /tools or /tools.json
  def create
    @tool = current_user.tools.build(tool_params)

    respond_to do |format|
      if @tool.save
        format.html { redirect_to tool_url(@tool), notice: 'Tool was successfully created.' }
        format.json { render :show, status: :created, location: @tool }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tools/1 or /tools/1.json
  def update
    respond_to do |format|
      if @tool.update(tool_params)
        format.html { redirect_to tool_url(@tool), notice: 'Tool was successfully updated.' }
        format.json { render :show, status: :ok, location: @tool }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tools/1 or /tools/1.json
  def destroy
    @tool.destroy

    respond_to do |format|
      format.html { redirect_to tools_url, notice: 'Tool was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def correct_user
    @tool = current_user.tools.find_by(id: params[:id])
    redirect_to tools_path, notice: 'Not Authorized To Edit This Tool' if @tool.nil?
  end

  def reset_date_of_use
    @tool = Tool.find(params[:id])
    @tool.update(date_of_use: nil, date_due_to: nil)

    respond_to do |format|
      format.html { redirect_to tool_url(@tool), notice: 'Date of use reset successfully.' }
      format.json { render :show, status: :ok, location: @tool }
    end
  end

  def update_date_of_use
    @tool = Tool.find(params[:id])
    if params[:reset_date_of_use]
      @tool.update(date_of_use: nil, date_due_to: nil)
      redirect_to tool_url(@tool), notice: 'Date of use reset successfully.'
    else
      if @tool.can_update_date_of_use? && @tool.update(tool_params)
        redirect_to tool_url(@tool), notice: 'Tool was successfully updated.'
      else
        # Handle update errors
      end
    end
  

  def correct_user
    @tool = Tool.find(params[:id])
    unless current_user.admin? || @tool.user == current_user
      redirect_to tools_path, notice: 'Not Authorized'
    end
  end
   

end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tool
    byebug
    @tool = Tool.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tool_params
    # Ensure date_of_use is set to nil if it's an empty string
    params.require(:tool).permit(:id_tool, :precinto, :link_to_pdf, :clase, :pin, :box , :date_of_use, :date_due_to, :days_left, :state)
          .tap { |whitelisted| whitelisted[:date_of_use] = nil if whitelisted[:date_of_use].blank? }
  end
end
