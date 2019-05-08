require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'
require 'pry'

class UserTest < MiniTest::Test
  def setup
    @sal = User.new("Sal")
    @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
  end

  def test_sal_is_user

    assert_instance_of User, @sal
  end

  def test_sal_has_name

    assert_equal "Sal", @sal.name
  end

  def test_sal_starts_with_no_jokes

    assert_equal [], @sal.jokes
  end

  def test_sal_can_learn_jokes
    @sal.learn(@joke_1)
    @sal.learn(@joke_2)

    assert_equal [@joke_1, @joke_2], @sal.jokes
  end
end
