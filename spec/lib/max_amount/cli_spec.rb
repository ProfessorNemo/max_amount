# frozen_string_literal: true

RSpec.describe MaxAmount::Seeker do
  subject(:seek) { described_class }

  let(:test) { File.read('./spec/support/fixtures/test_data.txt') }
  let(:stream) { generate_sample_data }
  let(:params) { { text: test, nmax: 50 } }
  let(:obj) { seek.new(params).check_errors.search }

  after do
    remove_config
  end

  describe '#initialize' do
    it 'sets a source of chars' do
      expect(described_class.new({ text: test, nmax: params[:nmax] })).to be_a described_class
      expect(seek.new(params).instance_variable_get(:@input_data)).to be test
      expect(seek.new(params).instance_variable_get(:@count_numbers)).to be params[:nmax]
    end
  end

  context 'when the test is empty' do
    let(:test) { '' }

    it 'returns nothing' do
      expect(params[:test]).to be_nil
    end
  end

  context 'when test array data is correct' do
    it 'return 6 maximum integers' do
      expect(obj).to include(806, 96, 94, 80, 73, 68, 50, 47, 46, 44)
      expect(obj).not_to include(100)
    end

    it 'array size no more than 50 and number length no more than 1000' do
      expect(obj.size).to be <= params[:nmax]
      expect(number_length(obj.max)).to be <= described_class::MAX_SIZE_DIGITAL
    end
  end

  describe '#search' do
    let(:params) { { text: stream, nmax: 50 } }
    let(:obj) { seek.new(params).check_errors.search }

    context 'when the data of a randomly generated array is correct' do
      it 'if data correct' do
        expect(obj).not_to be_nil
        expect(obj).not_to be_empty
        expect(obj.is_a?(Array)).to be(true)
        expect(obj).not_to contain_exactly 2, 4, 7, 0, -1
      end

      it 'randomly array size no more than 50 and number length no more than 1000' do
        expect(number_length(obj.max)).to be <= Helpers::SampleDataGenerator::DEFAULT_BYTES_COUNT
        expect(obj.size).to be <= params[:nmax]
      end
    end
  end

  describe 'parameters' do
    let(:fake_class) { instance_double(described_class) }

    it 'is possible to set input_data' do
      allow(fake_class).to receive(:input_data=).with(stream)
      fake_class.input_data = stream
    end

    it 'is possible to set count_numbers' do
      allow(fake_class).to receive(:count_numbers=).with(params[:nmax])
      fake_class.count_numbers = params[:nmax]
    end
  end
end
