require "spec_helper_rails"

describe Undo::Storage::RailsCache do
  it "uses Rails.cache by default" do
    adapter = described_class.new
    expect(Rails.cache).to receive :write
    adapter.put "foo", "bar"
  end

  it "stores object in cache" do
    adapter = described_class.new
    adapter.put "123", "hello" => "world"
    expect(adapter.fetch "123").to eq "hello" => "world"
  end

  it "sends params correctly" do
    adapter = described_class.new Rails.cache, expires_in: 1.second
    expect { adapter.put "foo", "bar" }.not_to raise_error
  end
end
