require "spec_helper"

describe WsHashie::Clash do
  before do
    @c = WsHashie::Clash.new
  end

  it 'expect c.where(:abc => "def").order(:created_at) to eq {:where => {:abc => "def"}, :order => :created_at}' do
    expect(@c.where(:abc => 'def').order(:created_at)).to eq({:where => {:abc => 'def'}, :order => :created_at})
  end

  it 'expect c.where!.abc("def").ghi(123)._end!.order(:created_at) to eq {:where => {:abc => "def", :ghi => 123}, :order => :created_at}' do
    expect(@c.where!.abc('def').ghi(123)._end!.order(:created_at)).to eq({:where => {:abc => "def", :ghi => 123}, :order => :created_at})
  end

  it 'expect c.where(:abc => "def").where(:hgi => 123) to equal {:where => {:abc => "def", :hgi => 123}}' do
    expect(@c.where(:abc => "def").where(:hgi => 123)).to eq({:where => {:abc => "def", :hgi => 123}})
  end
end
