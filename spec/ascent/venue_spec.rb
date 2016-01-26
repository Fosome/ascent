require "spec_helper"

RSpec.describe Ascent::Venue do
  subject { described_class.new("RGST") }

  describe "#code" do
    it "returns the venue code" do
      expect(subject.code).to eq("RGST")
    end

    it "returns the code upcased" do
      expect(described_class.new("rgst").code).to eq("RGST")
    end
  end

  describe "#to_s" do
    subject { described_class.new("RGST") }

    it "returns the venue code" do
      expect(subject.to_s).to eq("RGST")
    end
  end
end
