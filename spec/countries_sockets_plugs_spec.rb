require_relative 'countries_sockets_plugs'

describe "Countries_Sockets contant" do
  
  it "checks if each country has sockets" do 
    CountriesSocketsPlugs::COUNTRIES_SOCKETS.each do |c|
      expect(c[1]).to_not be_empty
    end
  end

  it "delivers the sockets for a given land" do 
    expect(CountriesSocketsPlugs::get_sockets("Germany")).to eq [:C, :F]
  end
  
  it "delivers the plugs for a given socket" do 
    expect(CountriesSocketsPlugs::get_plugs(:O)).to eq [:C, :O]
  end

  it "checks if a given country exists and returns true because it does" do
    expect(CountriesSocketsPlugs::validate_country_name("Denmark")).to be true
  end

  it "checks if a given country exists and returns false because it doesn't " do
    expect(CountriesSocketsPlugs::validate_country_name("Gfkaj")).to be false
  end
end