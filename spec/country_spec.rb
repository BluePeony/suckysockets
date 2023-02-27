require_relative 'country'

describe Country do 

  context "just with default country as argument" do

    before do
     @c_start = Country.new 
    end

    it "has United States as default name attribute" do
      expect(@c_start.name).to eq  "United States"
    end

    it "has a set socket attribute" do 
      expect(@c_start.sockets).to eq [:A, :B]
    end

    it "compares the sockets of two countries --> adapter is needed" do
      c_dest = Country.new("Germany")
      expect(@c_start.needs_adapter_for?(c_dest)).to be true
    end

    it "compares the sockets of two countries --> adapter needed despite equal socket types" do
      c_dest = Country.new("Bermuda")
      expect(@c_start.needs_adapter_for?(c_dest)).to be true
    end

  end

  context "with a name as a parameter" do 

    it "has a valid country name" do
      c = Country.new("Germany")
      expect(c.name).to eq "Germany"
    end

    it "has an invalid country name" do 
      c = Country.new("Blabla")
      expect(c.name).to eq nil
    end
  end
end