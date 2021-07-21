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
       show.characters.each do |character|
         if character.name == character.name.upcase && character.salary > 500_000
           main_characters << character
         end
       end
     end
     main_characters

  end

  def actors_by_show
    actors_by_show = Hash.new {|hash, key| hash[key] = []}
    @shows.each do |show|
      show.actors.each do |actor|
        actors_by_show[show] << actor
      end
    end
    actors_by_show
  end

  def shows_by_actor
    shows_by_actor = Hash.new {|hash, key| hash[key] = []}

    network_actors.each do |actor|
      @shows.each do |show|
        if show.actors.include?(actor)
          shows_by_actor[actor] << show
        end
      end
    end
    shows_by_actor
  end

  def network_actors
    actors = []
    @shows.each do |show|
      actors << show.actors
    end
    actors.flatten.uniq
  end

  


  def prolific_actors
    prolific_actors = []
    network_actors.each do |actor|
      if shows_by_actor[actor].count > 1
        prolific_actors << actor
      end
    end
    prolific_actors
  end
end
