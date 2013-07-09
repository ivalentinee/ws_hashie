require "ws_hashie/mash"

describe WsHashie::Mash, "#name?" do
  it "mash.name? should return false" do
    mash = WsHashie::Mash.new
    mash.name?.should eq(false)
  end
end


