# frozen_string_literal: true

RSpec.describe MaxAmount::Seeker do
  subject(:seek) { described_class }

  let(:test) { File.read('./spec/support/fixtures/test_data.txt') }

  describe '#errors' do
    context 'when nmax=0' do
      let(:params) { { text: test, nmax: 0 } }

      specify '#check_errors' do
        expect(check(seek, params)).to eq 'The entered number cannot equal to zero'
      end
    end

    context 'when nmax<0' do
      let(:params) { { text: test, nmax: -10 } }

      specify '#check_errors' do
        expect(check(seek, params)).to eq 'The entered number must be positive'
      end
    end

    context 'when test empty' do
      let(:params) { { text: '', nmax: 10 } }

      specify '#check_errors' do
        expect(check(seek, params)).to eq 'The string cannot be empty'
      end
    end

    context 'when string and number does not exist' do
      let(:params) { { text: nil, nmax: nil } }

      specify '#check_errors' do
        expect(check(seek, params)).to eq 'The string and number must exist'
      end
    end

    context 'when the resulting array contains no numbers' do
      let(:params) { { text: test.gsub(/\d+/, ''), nmax: 10 } }

      specify '#check_errors' do
        expect(check(seek, params)).to eq 'Must have at least one number'
      end
    end

    context 'when the number length exceeds the specified value' do
      let(:params) { { text: test + rand(1100**1100).to_s, nmax: 10 } }

      specify '#check_errors' do
        expect(check(seek, params)).to eq 'The length of the number cannot exceed the specified value'
      end
    end
  end
end
