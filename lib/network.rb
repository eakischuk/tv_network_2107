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

  def shows_by_actor
    shows_by_actor = Hash.new {|hash, key| hash[key] = []}
    actors = []
    @shows.each do |show|
      actors << show.actors
    end
    actors_flat = actors.flatten.uniq

    actors_flat.each do |actor|
      @shows.each do |show|
        if show.actors.include?(actor)
          shows_by_actor[actor] << show
        end
      end
    end
    shows_by_actor
  end
end
