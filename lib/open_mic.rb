class OpenMic
  attr_reader :location, :date, :performers, :repeated_jokes

  def initialize(
    location:,
    date:
  )

    @location = location
    @date = date
    @performers = []
    @repeated_jokes = false
  end

  def welcome(user)
    performers.push(user)
  end

  def repeated_jokes?
    jokes = performers.find_all do |performer|
      performer.
    end

  end
end
