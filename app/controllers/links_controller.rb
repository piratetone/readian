class LinksController < ApplicationController
  #before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]


  def index
    # @links = Link.all
    @links = Link.order(:cached_votes_up => :desc)
  end

  def show
    @link = Link.find(params[:id])
    @comments = @link.comments.all
    @comment = @link.comments.build
  end

  def new
    @link = current_user.links.build
  end

  def edit
  end


  def create
    @link = current_user.links.build(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def upvote
  @link = Link.find(params[:id])
  @link.liked_by current_user
  redirect_to @link
  #redirect_to action: "index"
end

def downvote
  @link = Link.find(params[:id])
  @link.downvote_from current_user
  redirect_to @link
end

def leftvote
  @link = Link.find(params[:id])
  @political_points = @link.political_points - 1.0
  pry
  redirect_to @link
end

def rightvote
  @link = Link.find(params[:id])
  @link.liked_by current_user
  redirect_to @link
end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:title, :url)
    end
end
