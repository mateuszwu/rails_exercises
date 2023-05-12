# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateSth do
  describe '.call' do
    it 'calls DoSth for each user and randomize string' do
      CreateSth.call(Event.new)
    end
  end
end