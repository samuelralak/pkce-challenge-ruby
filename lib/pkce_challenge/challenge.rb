# frozen_string_literal: true

require 'base64'
require "digest"
require "securerandom"

module PkceChallenge
  class Challenge
    attr_reader :verifier, :code_challenge, :code_verifier

    # constants definition

    CHAR_LENGTH = {
      default: 48,
      max: 128,
      min: 43,
    }.freeze

    def initialize(options = {})
      length = (options[:char_length] || CHAR_LENGTH[:default]).to_i

      unless length.between?(CHAR_LENGTH[:min], CHAR_LENGTH[:max])
        raise PkceChallenge::LengthOutOfRangeError
      end

      random_bytes = SecureRandom.random_bytes(length)
      # NOTE: we set both code_verifier and verifier to the same value
      # to keep backward compatibility
      @code_verifier = @verifier = Base64.urlsafe_encode64(random_bytes, padding: false)
      @code_challenge = Base64.urlsafe_encode64(Digest::SHA256.digest(code_verifier), padding: false)
    end
  end
end
