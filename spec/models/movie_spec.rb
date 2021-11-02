require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many :movie_actors}
    it { should have_many :actors}
  end

  describe 'methods' do
    it 'sorts actors by age' do
      studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      movie1 = studio1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
      actor2 = movie1.actors.create!(name: 'Tim', age: 30)
      actor1 = movie1.actors.create!(name: 'Jim', age: 25)

      expect(movie1.actor_sort).to eq([actor1, actor2])
    end

    it 'averages age' do
      studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      movie1 = studio1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
      actor2 = movie1.actors.create!(name: 'Tim', age: 30)
      actor1 = movie1.actors.create!(name: 'Jim', age: 25)

      expect(movie1.average_age).to eq(27.5)
    end
  end
end
