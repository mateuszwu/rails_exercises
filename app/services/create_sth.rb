class CreateSth < Patterns::Service
  def initialize(event)
    @event = event
  end

  def call
    event.users.each do |user|
      DoSth.call(user, some_string)
    end
  end

  private

  attr_reader :event

  def some_string
    ReturnSth.result_for(event.some_strings)
  end
end

# CreateSth.call(Event.new)