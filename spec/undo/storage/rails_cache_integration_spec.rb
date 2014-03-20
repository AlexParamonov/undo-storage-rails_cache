require "spec_helper_rails"

describe Undo::Storage::RailsCache do
  it "stores and fetches object" do
    subject.store "123", "hello" => "world"
    expect(subject.fetch "123").to eq "hello" => "world"
  end

  it "uses Rails.cache by default" do
    expect(Rails.cache).to receive :write
    subject.store "foo", "bar"
  end

  describe "options" do
    it "accepts known options" do
      expect { subject.store "foo", "bar", expires_in: 1.minute }.not_to raise_error
    end

    it "silently ignores unknown options" do
      expect { subject.store "foo", "bar", unknown: [:something] }.not_to raise_error
    end
  end
end
