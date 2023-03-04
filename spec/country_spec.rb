require_relative '../country'
require_relative '../countries_sockets_plugs'

describe Country do

  include CountriesSocketsPlugs
  
  context "with USA as default" do

    before do
      @start = Country.new
    end

    it "checks that the name is USA" do
      expect(@start.name).to eq "USA"
    end

    it "expects that the sockets are [:A, :B]" do
      expect(@start.sockets).to eq [:A, :B]
    end

    it "checks that the plugs are [[:A], [:A, :B]]" do
      plugs = []
      @start.sockets.each do |socket|
        plugs << get_plugs(socket)
      end

      expect(plugs).to eq [[:A], [:A, :B]]
    end
    
  end

  context "with a valid country name" do

    before do
      @start_country = Country.new("Germany")
    end

    it "checks that the country name is valid" do 
      expect(@start_country.name).to eq "Germany"
    end

    it "checks that the input country has valid sockets" do
      expect(@start_country.sockets).to eq [:C, :F]
    end

    it "checks that an adapter is not needed" do
      dest_country = Country.new("Sweden")
      expect(@start_country.needs_adapter_for?(dest_country)).to be false
      expect do 
        @start_country.needs_adapter_for?(dest_country)
      end.to output("\nNo adapter needed when travelling from Germany to Sweden.\n").to_stdout
    end

    it "checks that an adapter is definetely needed" do 
      dest_country = Country.new("Bermuda")
      expect(@start_country.needs_adapter_for?(dest_country)).to be true
      expect do 
        @start_country.needs_adapter_for?(dest_country)
      end.to output("\nAdapter is definetely needed when travelling from Germany to Bermuda because the plugs in Germany don't fit any of the sockets in Bermuda.\n").to_stdout

    end

    it "checks that an adapter is possibly needed" do
      dest_country = Country.new("Thailand")
      expect(@start_country.needs_adapter_for?(dest_country)).to be true
      expect do 
        @start_country.needs_adapter_for?(dest_country)
      end.to output("\nAdapter is needed when travelling from Germany to Thailand because:\n  - The plug types C, F don't fit into socket type A\n  - The plug types C, F don't fit into socket type B\n  - The plug type F does not fit into socket type O\n").to_stdout
    end
  end

  context "with an unvalid country name" do 

    it "checks that an unvalid name does not get validated" do
      expect do
        country = Country.new("Dkldjee")
      end.to output("Country Dkldjee was not found in the database.").to_stdout

      country = Country.new("Dkldjee")
      expect(country).to be true      
    end

  end

end
