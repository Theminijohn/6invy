class ShowsController < ApplicationController

	# In Rails 4 before_filter was changed to before_action and must set before the set_show Action
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_show, only: [:show, :edit, :update, :destroy]
	before_action :check_show_existence, only: [:new, :create]

  # GET /shows
  # GET /shows.json
  def index
    @shows = Show.all.page(params[:page]).per_page(10)
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
		@show = Show.find_by_name!(params[:id])
		@host = @show.user
		@clips = @host.clips
  end

  # GET /shows/new
  def new
    @show = current_user.build_show
  end

  # GET /shows/1/edit
  def edit
		@show = current_user.show
  end

  # POST /shows
  # POST /shows.json
  def create
    @show = current_user.build_show(show_params)

    respond_to do |format|
      if @show.save
        format.html { redirect_to @show, notice: 'Show was successfully created.' }
        format.json { render action: 'show', status: :created, location: @show }
      else
        format.html { render action: 'new' }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shows/1
  # PATCH/PUT /shows/1.json
  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to @show, notice: 'Show was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to shows_url }
      format.json { head :no_content }
    end
	end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find_by_name!(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_params
      params.require(:show).permit(:name, :cover, :facebook_link, :twitter_link,
																	 :instagram_link, :show_title, :announcement,
																   :avatar)
		end

	def check_show_existence
		redirect_to root_path, alert: "You already registered a Show" if current_user.show
	end
end
