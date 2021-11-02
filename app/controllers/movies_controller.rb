class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    actor = Actor.where(name: "#{params[:add_actor]}")
    @movie.actors << actor
    @movie.save
    redirect_to "/movies/#{@movie.id}"
  end
end