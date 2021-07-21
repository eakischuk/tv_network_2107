require 'rspec'
require './lib/character'
require './lib/show'
require './lib/network'

RSpec.describe Network do
  before(:each) do
    @nbc = Network.new("NBC")
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
  end

  describe 'network' do
    it 'is a network' do
      expect(@nbc).to be_a(Network)
    end

    it 'has a name' do
      expect(@nbc.name).to eq("NBC")
    end

    it 'starts without shows' do
      expect(@nbc.shows).to eq([])
    end

    it 'can add shows' do
      @nbc.add_show(@knight_rider)
      @nbc.add_show(@parks_and_rec)

      expect(@nbc.shows).to eq([@knight_rider, @parks_and_rec])
    end

    it 'has main characters' do
      @nbc.add_show(@knight_rider)
      @nbc.add_show(@parks_and_rec)

      expect(@nbc.main_characters).to eq([@michael_knight, @kitt, @leslie_knope, @ron_swanson])
    end

    it 'gives actors by show' do
      @nbc.add_show(@knight_rider)
      @nbc.add_show(@parks_and_rec)

      expect(@nbc.actors_by_show).to eq({@knight_rider => ["David Hasselhoff", "William Daniels"], @parks_and_rec => ["Amy Poehler", "Nick Offerman"]})
    end
  end
end
