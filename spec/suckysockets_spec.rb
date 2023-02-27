require_relative 'suckysockets'

describe SuckySocket do 

  context "with an invalid start country" do
    before do 
      @c = SuckySocket.new
      $stdIn = StringIO.new("Bla")
    end

    it "prints out the question for the start country" do 
      expect do
        (@c.run)
      end.to output("In which country do you live?\n").to_stdout
    end

  end
end