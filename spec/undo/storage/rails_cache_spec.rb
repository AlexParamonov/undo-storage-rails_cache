require "spec_helper_lite"
require 'undo/storage/rails_cache'

describe Undo::Storage::RailsCache do
  let(:adapter) { described_class.new cache }
  let(:cache) { double :cache }

  it "writes hash to cache as json" do
    expect(cache).to receive(:write).with("123", '{"hello":"world"}', anything)
    adapter.put "123", "hello" => "world"
  end

  it "reads hash from cache" do
    expect(cache).to receive(:read).with("123", anything) { '{"hello":"world"}' }
    expect(adapter.fetch "123").to eq "hello" => "world"
  end

  it "does not raise when created without arguments" do
    expect { described_class.new }.not_to raise_error
  end

  describe "options" do
    let(:adapter) { described_class.new cache, options }
    let(:options) { Hash.new }

    it "sends provided options to cache.read" do
      expect(cache).to receive(:read).with any_args, options
      adapter.fetch "foo"
    end

    it "sends provided options to cache.write" do
      expect(cache).to receive(:write).with any_args, options
      adapter.put "foo", "bar"
    end

    before do
      # JSON.load behaves differently in 1.9
      allow(cache).to receive(:read).with(any_args) { { :foo => :bar }.to_json }
    end if RUBY_VERSION < "2.0"
  end
end
