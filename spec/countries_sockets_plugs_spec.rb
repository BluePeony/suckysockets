require_relative '../countries_sockets_plugs'

describe "Countries_Sockets contant" do
  
  it "checks if each country has sockets" do 
    CountriesSocketsPlugs::COUNTRIES_SOCKETS.each do |c|
      expect(c[1]).to_not be_empty
    end
  end

  it "checks if each socket has plugs" do 
    CountriesSocketsPlugs::SOCKETS_PLUGS.each do |s|
      expect(s[1]).to_not be_empty
    end
  end

end