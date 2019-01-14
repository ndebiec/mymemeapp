class MemesController < ApplicationController
  before_action :set_meme, only: [:show, :edit, :update, :destroy] 
  
  def index
    @memes = Meme.search(params[:caption])
  end
      
  def show
  end
    
  def new
    @meme=Meme.new
  end
    
  def edit
  end
    
  def create
    @meme=Meme.new(meme_params)
    @meme.user = current_user
    respond_to do |format|
      if @meme.update(meme_params)
        format.html {redirect_to @meme, notice: 'Meme was succesfully uploaded' }
        format.json {render :show, status: :created, location: @meme}
      else
        format.html {render :new }
        format.json {render json: @meme.errors, status: :unprocessable_entity}
      end
    end
  end
    
  def update
    respond_to do |format|
      if @meme.update(meme_params)
        format.html { redirect_to @meme, notice: 'Meme was succesfully updated' }
        format.json { render :show, status: :ok, location: @meme }
      else
        format.html { render :new }
        format.json { render json: @meme.errors, status: :unprocessable_entity }
      end
    end
  end
    
  def hashtags
    tag = Tag.find_by(name: params[:name])
    @hashtag = tag.name
    @memes = tag.memes
  end
   
  def destroy
    @meme.destroy!
    respond_to do |format|
      format.html { redirect_to memes_url, notice: 
                   'Meme was succesfully deleted' }
      format.json { head :no_content }
    end
  end
    
  private
   
  def set_meme
    @meme = Meme.find(params[:id])
  end
    
  def meme_params
    params.require(:meme).permit(:caption, :picture, :user_id, :hashtags)
  end
    
end