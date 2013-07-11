require "spec_helper"
require "fixtures/man"
require "fixtures/result"

describe WsHashie::Trash do
  it 'expect Man.new(:firstName => "Bob") not to raise ArgumentError' do
    expect{Man.new(:firstName => "Bob")}.not_to raise_error
  end

  it 'expect result.id.class to be Fixnum' do
    result = Result.new(:id => '123', :creation_date => '2012-03-30 17:23:28')
    expect(result.id.class).to be Fixnum
  end

  it 'expect result.created_at.class to be Time' do
    result = Result.new(:id => '123', :creation_date => '2012-03-30 17:23:28')
    expect(result.created_at.class).to be Time
  end
end
