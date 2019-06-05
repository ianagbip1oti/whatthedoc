
require 'css'

RSpec.describe do

  subject { Css.new.query query }

  context 'when query float' do
    let(:query) { 'float' }

    its(:name) { is_expected.to eq('float') }

    its(:description) do
      is_expected.to eq(
        'The float CSS property places an element '\
        'on the left or right side of its container, '\
        'allowing text and inline elements to wrap around it')
    end

    its(:signature) do
      is_expected.to eq(
        <<~SYNTAX.chomp
        /* Keyword values */
        float: left;
        float: right;
        float: none;
        float: inline-start;
        float: inline-end;

        /* Global values */
        float: inherit;
        float: initial;
        float: unset;
        SYNTAX
      )
    end

    its(:values) do
      is_expected.to eq([
        Value.new(
          'left',
          'The element must float on the left side of its containing block.'),
        Value.new(
          'right',
          'The element must float on the right side of its containing block.'),
        Value.new(
          'none',
          'The element must not float.'),
        Value.new(
          'inline-start',
          'The element must float on the start side of its containing block'),
        Value.new(
          'inline-end',
          'The element must float on the end side of its containing block')
      ])
    end
  end

  context 'when query margin' do
    let(:query) { 'margin' }

    its(:name) { is_expected.to eq('margin') }
  end

  context 'when query not found' do
    let(:query) { 'thing-that-does-not-exist' }

    it { is_expected.to be_kind_of(Error) }
    its(:message) { is_expected.to_not be_nil }
  end
end

