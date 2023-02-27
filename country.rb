
require_relative 'countries_sockets_plugs'

class Country

	include CountriesSocketsPlugs

	attr_reader :name, :sockets

	def initialize(name = "United States")
		if validate_country_name(name)
			@name = name
			@sockets = get_sockets("#{@name}")
		else
			puts "Country #{name} was not found in the database."
			exit
		end		
	end

	def needs_adapter_for(dest_country)

		dest_plugs = []
		dest_country.sockets.each do |s|
			dest_plugs << get_plugs(s)
		end
		
		# if dest_plugs.any? { |dp| !(sockets - dp).empty? }
		# 	adapter_needed = true
		# else
		# 	adapter_needed = false
		# end

		problem_plugs = []
		dest_plugs.each do |dp|
			problem_plugs << (sockets - dp)
		end

		if problem_plugs.flatten.size == 0
			puts "No adapter needed when travelling from #{name} to #{dest_country.name}."
		else
			puts "Adapter is needed when travelling from #{name} to #{dest_country.name} because:"
			problem_plugs.each_with_index do |plug, ind|
				if plug.size == 1
					puts "  - The plug type #{plug.join(', ')} does not fit into socket type #{dest_country.sockets[ind]}"
				elsif plug.size > 1
					puts "  - The plug types #{plug.join(', ')} don't fit into socket type #{dest_country.sockets[ind]}"
				end
			end
		end

	end

end

if __FILE__ == $0
	c_start = Country.new("Denmark")
	#p c_start.sockets
	c_dest = Country.new("Germany")
	#p c_dest.sockets
	puts c_start.needs_adapter_for?(c_dest)
end