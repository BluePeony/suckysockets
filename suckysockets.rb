require_relative 'country'

module SuckySocket # a module is a bucket for related methods

	def self.run
		puts "In which country do you live?"
		start_country = Country.new(gets.chomp)
		puts "What is your destination country?"
		destination_country = Country.new(gets.chomp)

		# if start_country.needs_adapter_for?(destination_country) 
		# 	puts "Adapter needed!"
		# else
		# 	puts "No adapter needed!" 
		# end

		start_country.needs_adapter_for(destination_country)
	end
end

SuckySocket.run