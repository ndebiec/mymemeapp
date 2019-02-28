# frozen_string_literal: true

class TagsController < ApplicationController
  def index
    @tags = TagDecorator.decorate_collection(Tag.all)
  end      

end