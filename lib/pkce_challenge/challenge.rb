# frozen_string_literal: true

require "digest"
require "securerandom"

module PkceChallenge
  class Challenge
    attr_reader :verifier, :code_challenge

    def initialize(options = {})
      @options = options
    end

    def code_verifier
      @verifier ||= generate_code_verifier
    end

    def code_challenge
      @code_challenge ||= generate_pkce_challenge
    end

    # constants definition

    CHAR_LENGTH = {
      default: 48,
      max: 128,
      min: 43,
    }.freeze

    private

    def generate_code_verifier
      length = (@options[:char_length] || CHAR_LENGTH[:default]).to_i

      unless length.between?(CHAR_LENGTH[:min], CHAR_LENGTH[:max])
        raise PkceChallenge::LengthOutOfRangeError
      end

      urlsafe_base64(SecureRandom.base64((length * 3) / 4))
    end

    def generate_pkce_challenge
      urlsafe_base64(Digest::SHA256.base64digest(code_verifier))
    end

    def urlsafe_base64(base64_str)
      base64_str.tr("+/", "-_").tr("=", "")
    end
  end
end
