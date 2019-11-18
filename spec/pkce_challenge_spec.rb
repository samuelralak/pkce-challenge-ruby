# frozen_string_literal: true

require "spec_helper"

RSpec.describe PkceChallenge do
  describe "#challenge" do
    let(:challenge) { PkceChallenge.challenge }

    it "should be an instance of Challenge" do
      expect(challenge).to be_an_instance_of(PkceChallenge::Challenge)
    end

    it "should have verifier with default char length" do
      expect(challenge.code_verifier.length).to equal(48)
    end

    it "should raise an error when invalid length is given" do
      expect {
        PkceChallenge.challenge(char_length: 1)
      }.to raise_error(PkceChallenge::LengthOutOfRangeError)
    end
  end
end
