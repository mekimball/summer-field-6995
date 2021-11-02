require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'Relationships' do
    it { should have_many :movie_actors}
    it { should have_many :movies}
  end
end