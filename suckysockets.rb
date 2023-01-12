require_relative 'country'

module SuckySocket # a module is a bucket for related methods

	def self.run
		puts "In which country do you live?"
		while !((start_country = Country.new(gets.chomp)).name) do 
			puts "The entered country name is invalid. Please try again."
		end
		puts "What is your destination country?"
		while !((destination_country = Country.new(gets.chomp)).name) do 
			puts "The entered country name is invalid. Please try again."
		end

		if start_country.needs_adapter_for?(destination_country) 
			puts "Adapter needed!"
		else
			puts "No adapter needed!" 
		end
	end
end

SuckySocket.run