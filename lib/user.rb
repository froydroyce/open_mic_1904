class User
  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes.push(joke)
  end

  def tell(name, joke)
    name.learn(joke)
  end

  def joke_by_id(id)
    joke_id = jokes.find_all do |joke|
    id == joke.id
    end
    joke_id.first
  end
end
