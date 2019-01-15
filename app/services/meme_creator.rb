class MemeCreator

  def initialize(params, current_user)
      @params = params
      @current_user = current_user
  end

  def call
    @meme = Meme.new(@params)    
    @meme.user = @current_user
    @meme.save
    
    @meme.extract_tags
    
    @meme
  end

end