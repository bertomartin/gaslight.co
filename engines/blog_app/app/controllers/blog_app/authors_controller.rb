module BlogApp
  class AuthorsController < ApplicationController

    respond_to :json

    def index
      render json: { authors: Author.all }
    end

  end
end