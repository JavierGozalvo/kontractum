require "rails_helper"
include ActiveSupport::Testing::TimeHelpers

RSpec.describe User, :type => :model do
    let(:user1) do 
        User.new(       name: "Javo",
                        surname: "Cervera",
                        doc_id: "56378756A",
                        doc_kind: :passport,
                        email: "Javo@gmail.com",
                        birthdate: "3-5-1998")
    end


    it "is valid with good attributes" do
        expect(user1).to be_valid
    end
    it "is not valid without a name" do
        user1.name = nil
        expect(user1).to_not be_valid
    end
    it "is not valid without a surname" do
        user1.surname = nil
        expect(user1).to_not be_valid
    end
    it "is not valid without a document ID" do
        user1.doc_id = nil
        expect(user1).to_not be_valid
    end
    it "is not valid without a wrong document kind" do
        user1.doc_kind = nil
        expect(user1).to_not be_valid
    end
    it "is not valid without a correct email" do
        user1.email = "javo#mail.com"
        expect(user1).to_not be_valid
    end
    it "is not valid without a VALID doc_id format" do
        user1.doc_id = "534594N"
        expect(user1).to_not be_valid
    end

    context "Verifying Adultness on year 1994 when... " do

      before do
        travel_to Time.local(1994) ##Dia y mes
      end
        it "birthdate is not valid" do
            user1.birthdate = nil
            expect(user1).to_not be_valid
        end
      
  
        it "a Man was born on 1845 (Age: 149 (Dead))" do
            user1.birthdate = "3/5/1845"
            expect(user1.is_adult?).to be false
        end
      
          
        it "a Woman was born on 1930 (Age: 64)" do
            user1.birthdate = "22/7/1930"
            expect(user1.is_adult?).to be true
        end
      
      
        it "a boy was born on 2004 (Age: Not born!)" do
            user1.birthdate = "21/7/2004"
            expect(user1.is_adult?).to be false
        end
      

        it "a boy was born on 1984 (Age: 10)" do
            user1.birthdate = "21/7/2004"
            expect(user1.is_adult?).to be false
        end
      after do 
        travel_back
      end

      
    end

end