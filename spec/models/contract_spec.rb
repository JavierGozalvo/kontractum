require "rails_helper"

RSpec.describe Contract, :type => :model do
    
    user1 = User.new( name: "Javo",
      surname: "Cervera",
      doc_id: "56378756A",
      doc_kind: :passport,
      email: "Javo@gmail.com",
      birthdate: "3-5-1998")

    let(:contract1) do
        Contract.new(   title:"Renting",
                        desc:"A contract to manage car renting",
                        kind:"Cars",
                        status: :drafted,
                        user_id: user1)
    end
    
    
    it "is valid with valid attributes" do
        expect(contract1).to be_valid
    end
    
    it "is not valid without a title" do
        contract1.title = nil
        expect(contract1).to_not be_valid
    end

    it "is not valid a short title" do
        contract1.title = "An"
        expect(contract1).to_not be_valid
    end

    it "is not valid without a user_id" do
        contract1.user_id = nil
        expect(contract1).to_not be_valid
    end

    it "is not valid without a kind" do
        contract1.kind = nil
        expect(contract1).to_not be_valid
    end

    it "is not valid a with a wrong status" do
        contract1.status = 0 #expired: 0, drafted: 1, drafted: 2#
        expect(contract1).to_not be_valid
    end
    
end