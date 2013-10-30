module BlogApp
  class AuthorsController < ApplicationController

    respond_to :json

    def index
      render :json => Author.all
    end

  end
end