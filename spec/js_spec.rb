
require 'js'

RSpec.describe do

  subject { JavaScript.new.query query }

  context 'when query Array.foreach' do
    let(:query) { 'Array.foreach' }

    its(:name) { is_expected.to eq('array.forEach') }
    its(:returns) { is_expected.to eq('undefined.') }

    its(:description) do
      is_expected.to eq(
        'The forEach() method executes a provided '\
        'function once for each array element.')
    end

    its(:signature) do
      is_expected.to eq(
        <<~SYNTAX.chomp
          arr.forEach(function callback(currentValue[, index[, array]]) {
              //your iterator
          }[, thisArg]);
        SYNTAX
      )
    end
  end
end

