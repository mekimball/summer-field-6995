class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  # def coactors
  #   # coactors = Actor.joins(:movies).select(movie_actors [actor: :self]).distinct.pluck(:name)

  #   coactors = Actor.joins(:movies).where(actors: {id: self}).distinct.pluck(:name)
  # end
end