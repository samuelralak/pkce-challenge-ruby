# frozen_string_literal: true

require "digest"

module PkceChallenge
  class Challenge
    attr_accessor :code_verifier, :code_challenge

    def initialize(options = {})
      @char_length = (options[:char_length] || CHAR_LENGTH[:default]).to_i

      unless @char_length.between?(CHAR_LENGTH[:min], CHAR_LENGTH[:max])
        raise PkceChallenge::LengthOutOfRangeError
      end

      @code_verifier = generate_code_verifier
      @code_challenge = generate_pkce_challenge
    end

    # constants definition

    CHAR_RANGE = [
      *"A".."Z",
      *"a".."z",
      *"0".."9",
      "-",
      ".",
      "_",
      "~",
    ].freeze

    CHAR_LENGTH = {
      default: 48,
      max: 128,
      min: 43,
    }.freeze

    private

    def generate_code_verifier
      Array.new(@char_length) { CHAR_RANGE[rand(CHAR_RANGE.length)] }.join
    end

    def generate_pkce_challenge
      Digest::SHA256.base64digest(@code_verifier).tr("+/", "-_").tr("=", "")
    end
  end
end
