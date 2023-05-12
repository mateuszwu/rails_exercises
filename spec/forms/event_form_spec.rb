# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventForm do
  describe '.save' do
    context 'when attributes are valid' do
      it 'returns true' do
        params = {
          registration_type: 'individual',
          individual_description: 'example',
          max_peoples: 0,
        }

        expect(
          EventForm.new(params).save!
        ).to eq(true)
      end
    end

    context 'when attributes are not valid' do
      # TODO
    end
  end
end
