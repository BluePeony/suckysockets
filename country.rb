require_relative 'countries_sockets_plugs'

class Country
	attr_reader :name, :sockets

	def initialize(name = "United States")
		validate(name)
		@sockets = CountriesSocketsPlugs::COUNTRIES_SOCKETS["#{@name}"]
	end

	def validate(name)
		if CountriesSocketsPlugs::COUNTRIES_SOCKETS.include?(name)
			@name = name
		end
	end

	def needs_adapter_for?(dest_country)

		dest_plugs = []
		dest_country.sockets.each do |s|
			dest_plugs << CountriesSocketsPlugs::SOCKETS_PLUGS[s]
		end
		
		if dest_plugs.any? { |dp| !(sockets - dp).empty? }
			adapter_needed = true
		else
			adapter_needed = false
		end

		adapter_needed
	end

end

if __FILE__ == $0
	c_start = Country.new("Denmark")
	#p c_start.sockets
	c_dest = Country.new("Germany")
	#p c_dest.sockets
	puts c_start.needs_adapter_for?(c_dest)
end