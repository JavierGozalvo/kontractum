require "rails_helper"

RSpec.describe Contract, :type => :model do
    contract1 = Contract.new(title: "Anything", desc: "Lorem ipsum", owner: "ok", kind: "fdf", status: 1)
    
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

    it "is not valid without a owner" do
        contract1.owner = nil
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

    p contract1
    
end