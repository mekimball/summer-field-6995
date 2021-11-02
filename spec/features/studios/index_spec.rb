require 'rails_helper'

RSpec.describe 'index page', type: :feature do
  before(:each) do
    @studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @studio2 = Studio.create!(name: 'Global Studios', location: 'San Diego')
    @movie1 = @studio1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @movie2 = @studio2.movies.create!(title: 'Waders of the Lost Park', creation_year: 1982, genre: 'Drama')
    @movie3 = @studio1.movies.create!(title: 'Up', creation_year: 2015, genre: 'Animated')
  end
  describe 'Studio Index' do
    it 'shows studios and movies' do
      visit studios_path

      expect(page).to have_content(@studio1.name)
      expect(page).to have_content(@studio1.location)
      expect(page).to have_content(@movie1.title)
      expect(page).to have_content(@movie3.title)
      expect(page).to have_content(@studio2.name)
      expect(page).to have_content(@studio2.location)
      expect(page).to have_content(@movie2.title)
    end
  end
end
