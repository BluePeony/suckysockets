require_relative 'country'

module SuckySocket 

	def self.run
		puts "In which country do you live?"
		start_country = Country.new(gets.chomp)
		puts "What is your destination country?"
		destination_country = Country.new(gets.chomp)

		start_country.needs_adapter_for?(destination_country)
	end
end

SuckySocket.run