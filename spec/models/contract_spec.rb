require "rails_helper"

RSpec.describe Contract, type: :model do

before do
	create_list(:contract, 5)
	FactoryBot.reload
end

	describe "search or customer" do 
		it "retrieves all contracts for admin" do
			expect(Contract.count).to eq(5)
		end

		it "filters contract if payable" do
			filter = Contract.by_payable(false)
			expect(filter.first.payable).to eq(false)
		end

		it "filters contract by owner" do
			filter = Contract.by_owner(1)
			expect(filter.first.owner.id).to eq(1)
		end

		it "filter contract by beneficiary" do
			filter = Contract.by_beneficiary(2)
			expect(filter.first.beneficiary.id).to eq(2)
		end

		it "filters contract by title" do
			filter = Contract.by_title("Car contract 1")
			expect(filter.first.title).to eq("Car contract 1")
		end

	end

end