require "rails_helper"

RSpec.describe User, :type => :model do
    user1 = User.new(name: "Javo",
                        surname: "Cervera",
                        doc_id: "56378389N",
                        doc_kind: 2,
                        email: "Javo@gmail.com",
                        birthdate: "3/5/98")

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
        user1.email = "javo@gmail.com"
        expect(user1).to_not be_valid
    end
    it "is not valid without a birthday" do
        user1.birthdate = nil
        expect(user1).to_not be_valid
    end

end