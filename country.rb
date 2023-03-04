require_relative 'countries_sockets_plugs'

class Country

	include CountriesSocketsPlugs

	attr_reader :name, :sockets

	# Use USA as default start_country when no country was entered by the user
	def initialize(name = "USA")
		if validate_country_name(name)
			@name = name
			@sockets = get_sockets("#{@name}")
		else
			puts "Country #{name} was not found in the database."
			exit
		end		
	end

	# Checks whether an adapter is needed by comparing whether the plugs of the start country match the plugs that work with every particular socket of the destination country
	def needs_adapter_for?(dest_country)

		dest_plugs = []
		dest_country.sockets.each do |s|
			dest_plugs << get_plugs(s)
		end
		

		problem_plugs = []
		dest_plugs.each do |dp|
			problem_plugs << (sockets - dp)
		end

		if problem_plugs.flatten.size == 0
			puts "\nNo adapter needed when travelling from #{name} to #{dest_country.name}."
			return false
		elsif problem_plugs.select { |pp| pp.sort != sockets }.size == 0 
			puts "\nAdapter is definetely needed when travelling from #{name} to #{dest_country.name} because the plugs in #{name} don't fit any of the sockets in #{dest_country.name}."
			return true
		else
			puts "\nAdapter is needed when travelling from #{name} to #{dest_country.name} because:"
			problem_plugs.each_with_index do |plug, ind|
				if plug.size == 1
					puts "  - The plug type #{plug.join(', ')} does not fit into socket type #{dest_country.sockets[ind]}"
				elsif plug.size > 1
					puts "  - The plug types #{plug.join(', ')} don't fit into socket type #{dest_country.sockets[ind]}"
				end
			end
			return true
		end

	end

end