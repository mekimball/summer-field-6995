require 'rails_helper'

RSpec.describe 'Actor Show Page', type: :feature do
  describe 'Show Page' do
    xit 'lists coactors for an actor' do
    studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    movie1 = studio1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    movie2 = studio1.movies.create!(title: 'Time', creation_year: 1981, genre: 'Action/Adventure')
    movie3 = studio1.movies.create!(title: 'Another Movie', creation_year: 1981, genre: 'Action/Adventure')
    actor1 = movie1.actors.create!(name: 'Jim', age: 25)
    actor2 = movie1.actors.create!(name: 'Tim', age: 30)
    actor3 = movie1.actors.create!(name: 'Kim', age: 25)
    actor4 = movie2.actors.create!(name: 'Spencer', age: 25)
    actor5 = movie3.actors.create!(name: 'Cole', age: 25)
    movie2.actors << actor1

    visit actor_path(actor1.id)

    expect(page).to have_content(actor2.name)
    expect(page).to have_content(actor3.name)
    expect(page).to have_content(actor4.name)
    expect(page).to_not have_content(actor5.name)
    end
  end
end
# As a user,
# When I visit an actor's show page
# I see that actors name and age
# And I see a unique list of all of the actors this particular actor has worked with.