require "spec_helper"
require "fixtures/person"

describe WsHashie::Dash do
  it 'Person.new shoud raise error' do
    expect{Person.new}.to raise_error ArgumentError, "The property 'name' is required for this Dash."
  end

  it 'p.name = nil shoud raise ArgumentError' do
    p = Person.new(:name => 'Bob')
    expect{p.name = nil}.to raise_error ArgumentError, "The property 'name' is required for this Dash."
  end

  it 'p.name should return "John"' do
    p = Person.new(:name => 'Bob')
    p.name = "John"
    expect(p.name).to eq("John")
  end

  it 'p.occupation should return "Rubyist"' do
    p = Person.new(:name => 'Bob')
    expect(p.occupation).to eq("Rubyist")
  end

  it 'p[:awesome] should raise NoMethodError' do
    p = Person.new(:name => 'Bob')
    expect{p[:awesome]}.to raise_error NoMethodError
  end

  it 'p[:occupation] should return "Rubyist"' do
    p = Person.new(:name => 'Bob')
    expect(p[:occupation]).to eq('Rubyist')
  end
end
