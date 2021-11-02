require 'rails_helper'

RSpec.describe 'Movie Show', type: :feature do
    before(:each) do
    @studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @movie1 = @studio1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @actor2 = @movie1.actors.create!(name: 'Tim', age: 30)
    @actor1 = @movie1.actors.create!(name: 'Jim', age: 25)
    visit movie_path(@movie1.id)
  end

  describe 'show page' do
    it 'shows movies information' do

      expect(page).to have_content(@movie1.title)
      expect(page).to have_content(@movie1.creation_year)
      expect(page).to have_content(@movie1.genre)
      expect(page).to have_content(@actor1.name)
      expect(page).to have_content(@actor2.name)
    end

    it 'lists actors by order of age' do

      expect(@actor1.name).to appear_before(@actor2.name)
    end

    it 'shows average actors age for movie' do

      expect(page).to have_content("Actor Average Age: #{@movie1.average_age}")
    end

    it 'can add an actor to a movie' do
      actor3 = Actor.create!(name: 'Kim', age: 76)
        
      expect(page).to_not have_content(actor3.name)

      fill_in :add_actor, with: 'Kim'
      click_button 'Submit'
      expect(page).to have_content(actor3.name)
    end
  end
end

# As a user,
# When I visit a movie show page,
# I do not see any actors listed that are not part of the movie
# And I see a form to add an actor to this movie
# When I fill in the form with the name of an actor that exists in the database
# And I click submit
# Then I am redirected back to that movie's show page
# And I see the actor's name is now listed
# (You do not have to test for a sad path, for example if the name submitted is not an existing actor)