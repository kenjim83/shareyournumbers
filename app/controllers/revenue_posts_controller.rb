class RevenuePostsController < ApplicationController
  before_action :set_revenue_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /revenue_posts
  # GET /revenue_posts.json
  def index
    @search = RevenuePost.search(params[:q])
    @revenue_posts = @search.result
  end

  # GET /revenue_posts/1
  # GET /revenue_posts/1.json
  def show
  end

  # GET /revenue_posts/new
  def new
    @movies_for_autocomplete = Movie.format_for_autocomplete
    @revenue_post = RevenuePost.new
  end

  # GET /revenue_posts/1/edit
  def edit
  end

  # POST /revenue_posts
  # POST /revenue_posts.json
  def create
    @revenue_post = RevenuePost.new(revenue_post_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @revenue_post.save
        format.html { redirect_to revenue_posts_path, notice: 'Revenue post was successfully submitted!' }
        format.json { render :show, status: :created, location: @revenue_post }
      else
        format.html { render :new }
        format.json { render json: @revenue_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /revenue_posts/1
  # PATCH/PUT /revenue_posts/1.json
  def update
    respond_to do |format|
      if @revenue_post.update(revenue_post_params)
        format.html { redirect_to @revenue_post, notice: 'Revenue post was successfully updated.' }
        format.json { render :show, status: :ok, location: @revenue_post }
      else
        format.html { render :edit }
        format.json { render json: @revenue_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /revenue_posts/1
  # DELETE /revenue_posts/1.json
  def destroy
    @revenue_post.destroy
    respond_to do |format|
      format.html { redirect_to revenue_posts_url, notice: 'Revenue post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_revenue_post
      @revenue_post = RevenuePost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def revenue_post_params
      params.require(:revenue_post).permit(:user_id, :movie_title, :movie_id, :distributor_id, :revenue, :published, :source_url)
    end
end
