require 'rails_helper'

RSpec.describe ReturnSth do
  it 'returns randomized text' do
    all_texts_urls = %w[aaa bbb ccc]
    initial_text_urls = 'aaa,bbb,ccc'
    result = []

    result << ReturnSth.result_for(initial_text_urls)
    result << ReturnSth.result_for(initial_text_urls)
    result << ReturnSth.result_for(initial_text_urls)

    expect(result.size).to eq(3)

    Timeout.timeout(5) do
      while result.uniq.size != all_texts_urls.size
        result << ReturnSth.result_for(initial_text_urls)
      end
    end

    expect(result.uniq).to match_array(all_texts_urls)
  end
end