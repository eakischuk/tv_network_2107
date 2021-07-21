class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    main_characters = []
    @shows.each do |show|
      main_characters << show.characters
    end
    main_characters.flatten
  end

  def actors_by_show
    actors_by_show = Hash.new {|hash, key| hash[key] = []}
    @shows.each do |show|
      show.characters.each do |character|
        actors_by_show[show] << character.actor
      end
    end
    actors_by_show
  end
end
