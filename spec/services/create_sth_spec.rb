# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateSth do
  describe '.call' do
    it 'calls DoSth for each user and randomize string' do
      allow(ReturnSth).to receive(:result_for).with('example1,example2,example3').and_return('test')
      allow(DoSth).to receive(:call)

      CreateSth.call(Event.new)

      expect(DoSth).to have_received(:call).with('user1', 'test')
      expect(DoSth).to have_received(:call).with('user2', 'test')
      expect(DoSth).to have_received(:call).with('user3', 'test')
    end
  end
end