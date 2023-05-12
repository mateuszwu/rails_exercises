# frozen_string_literal: true

class ReturnSth < Patterns::Calculation
  private

  def result
    subject.split(',').sample
  end
end
