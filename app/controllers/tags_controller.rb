# frozen_string_literal: true

class TagsController < ApplicationController
  def index
    @tags = Tag.all.order(name: :asc)
    #= TagDecorator.decorate_collection(Tag.all)
  end      

end