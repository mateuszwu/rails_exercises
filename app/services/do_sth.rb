class DoSth < Patterns::Service
  def initialize(user, text)
    @user = user
    @text = text
  end

  def call
    true
  end

  private

  attr_reader :user, :text
end