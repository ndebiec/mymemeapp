class UserDecorator < Draper::Decorator
  delegate_all
  decorates_association :memes
  
  def number_of_memes
    object.memes.count
  end

end
