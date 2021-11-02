require 'rails_helper'

RSpec.describe 'Movie Show', type: :feature do
    before(:each) do
    @studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @movie1 = @studio1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @actor2 = @movie1.actors.create!(name: 'Tim', age: 30)
    @actor1 = @movie1.actors.create!(name: 'Jim', age: 25)
  end
  describe 'show page' do
    it 'shows movies information' do
      visit "movies/#{@movie1.id}"

      expect(page).to have_content(@movie.name)
      expect(page).to have_content(@movie.creation_year)
      expect(page).to have_content(@movie.genre)
      expect(page).to have_content(@actor1.age)
      expect(page).to have_content(@actor2.age)
    end
  end
end

# As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors