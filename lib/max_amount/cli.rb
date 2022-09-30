# frozen_string_literal: true

module MaxAmount
  module CLI
    extend MaxAmount::Options

    def self.call(custom_string:)
      options = MaxAmount::Options.ask

      case options[:m]
      when '1'
        str = Dotenv.load('../.env')['TEST_STRING']
      when '2'
        str = SecureRandom.hex(options[:l].to_i)
      when '3'
        str = custom_string
      end

      params = {
        text: str,
        nmax: options[:n]&.to_i
      }

      params[:text] = params[:text].to_s.chomp unless params[:text].is_a?(String)

      begin
        output = MaxAmount::Seeker.new(params).check_errors.search.join("\n")
        puts output
      rescue MaxAmount::Error => e
        message = e.message
        puts message
      end
    end
  end
end
