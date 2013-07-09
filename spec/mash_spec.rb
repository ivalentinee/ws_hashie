require "ws_hashie/mash"

describe WsHashie::Mash do
  mash = WsHashie::Mash.new
  
  it "should return false" do
    mash.name?.should eq(false)
  end

  it "should return nil" do
    mash.name.should be_nil
  end

  it "should return 'My Mash'" do
    mash.name = "My Mash"
    mash.name.should eq("My Mash")
  end

  it "should return 'true'"
    mash.name.should be_true
  end
end


