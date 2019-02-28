class TagDecorator < Draper::Decorator
    delegate_all
    
    def hashtag_link
      "##{object.name}"
      #link_to("##{object.name}", "/memes/hashtag/#{object.name}") 
    end
  
  end