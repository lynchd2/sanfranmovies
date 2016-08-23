class MoviesController < ApplicationController
  helper UsersHelper

  def index
    @client = Soda.new
    @street = check_params(params[:search])
    @results = @client.movies_with_address(@street.split(" ")[1])
  end

  def show
    @title = params[:title]
  end
end
