# frozen_string_literal: true

require "pkce_challenge/version"
require "pkce_challenge/challenge"

module PkceChallenge
  class LengthOutOfRangeError < StandardError; end

  def self.challenge(options = {})
    PkceChallenge::Challenge.new(options)
  end
end
