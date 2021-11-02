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

      expect(page).to have_content(@movie1.title)
      expect(page).to have_content(@movie1.creation_year)
      expect(page).to have_content(@movie1.genre)
      expect(page).to have_content(@actor1.name)
      expect(page).to have_content(@actor2.name)
    end

    it 'lists actors by order of age' do
      visit "movies/#{@movie1.id}"

      expect(@actor1.name).to appear_before(@actor2.name)
    end

    it 'shows average actors age for movie' do
      visit "movies/#{@movie1.id}"

      expect(page).to have_content("Actor Average Age: #{@movie1.average_age}")
    end
  end
end

# As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors