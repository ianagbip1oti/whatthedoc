
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

    its(:parameters) do
      is_expected.to eq([
        Parameter.new(
          'callback', 
          'Function to execute for each element, taking three arguments'),
        Parameter.new(
          'currentValue',
          'The value of the current element being processed in the array.'),
        Parameter.new(
          'index',
          'The index of the current element being processed in the array.'),
        Parameter.new(
          'array',
          'The array that forEach() is being applied to.'),
        Parameter.new(
          'thisArg',
          'Value to use as this (i.e the reference Object) when executing callback')
      ])
    end
  end

  context 'when invalid query' do
    let(:query) { 'bad query' }

    it { is_expected.to be_kind_of(Error) }
    its(:message) { is_expected.to_not be_nil }
  end
end

