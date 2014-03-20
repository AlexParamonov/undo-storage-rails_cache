require "spec_helper_lite"
require 'undo/storage/rails_cache'

describe Undo::Storage::RailsCache do
  subject { described_class.new cache }
  let(:cache) { double :cache }

  it "does not raise when created without arguments" do
    expect { described_class.new }.not_to raise_error
  end

  it "uses provided cache storage" do
    subject = described_class.new cache

    expect(cache).to receive :write
    subject.store "foo", "bar"
  end

  it "writes hash as json" do
    expect(cache).to receive(:write).with("123", '{"hello":"world"}', anything)
    subject.store "123", "hello" => "world"
  end

  it "returns hash" do
    expect(cache).to receive(:read).with("123", anything) { '{"hello":"world"}' }
    expect(subject.fetch "123").to eq "hello" => "world"
  end

  describe "default options" do
    subject { described_class.new cache, options }
    let(:options) { { additional: :option } }

    it "sends provided options to cache.read" do
      expect(cache).to receive(:read).with anything, options
      subject.fetch "foo"
    end

    it "sends provided options to cache.write" do
      expect(cache).to receive(:write).with anything, anything, options
      subject.store "foo", "bar"
    end

    before do
      # JSON.load behaves differently in 1.9
      allow(cache).to receive(:read).with(any_args) { { :foo => :bar }.to_json }
    end if RUBY_VERSION < "2.0"
  end

  describe "options" do
    let(:object) { double :object }
    let(:options) { { foo: :bar } }

    it "accepts options per method" do
      cache.as_null_object

      expect do
        subject.store 123, object, options
        subject.fetch 123, options
      end.not_to raise_error
    end
  end
end
