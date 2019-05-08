require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'
require './lib/open_mic'
require 'pry'

class OpenMicTest < MiniTest::Test
  def setup
    @open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    @sal = User.new("Sal")
    @ali = User.new("Ali")
    @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
  end

  def test_open_mic_exists

    assert_instance_of OpenMic, @open_mic
  end

  def test_open_mic_has_attributes

    assert_equal "Comedy Works", @open_mic.location
    assert_equal "11-20-18", @open_mic.date
  end

  def test_open_mic_starts_with_no_performers

    assert_equal [], @open_mic.performers
  end

  def test_open_mic_can_welcome_user
    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)

    assert_equal [@sal, @ali], @open_mic.performers
  end

  def test_if_joke_is_not_repeated
    @ali.learn(@joke_1)
    @ali.learn(@joke_2)

    refute @open_mic.repeated_jokes?
  end

  def test_if_joke_is_repeated
    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)
    @ali.learn(@joke_1)
    @ali.learn(@joke_2)
    binding.pry
    @ali.tell(@sal, @joke_1)

    assert @open_mic.repeated_jokes?
  end
end
