# frozen_string_literal: true

module MemesHelper
  def render_with_hashtags(hashtags)
    hashtags.gsub(/#\w+/) { |tag| link_to tag, "/memes/hashtag/#{tag.downcase.delete('#')}" }.html_safe
  end
end
