require "rails_helper"

RSpec.describe User, type: :model do

	context "A user isn't valid without... " do

		it "valid attributes" do
			valid_user = build(:user)
			expect(valid_user).to be_valid
		end

		it "having a valid name" do
			non_valid_user = build(:user, name: nil)
			expect(non_valid_user).to_not be_valid
		end

		it "having a valid surname" do 
			non_valid_user = build(:user, surname: nil)
			expect(non_valid_user).to_not be_valid
		end

		it "having a valid doc_id" do
			non_valid_user = build(:user, doc_id: "36R5h7")
			expect(non_valid_user).to_not be_valid
		end

		it "having a valid email" do
			non_valid_user = build(:user, email: "bad#email.what")
			expect(non_valid_user).to_not be_valid
		end

		it "having a valid birthdate" do
			non_valid_user = build(:user, birthdate: nil)
			expect(non_valid_user).to_not be_valid
		end
	end

	context "Verifying adultness at date 03/05/1990 when..." do
	
		before do
			#travel_to Time.new(1990,05,03) #YYYY/MM/DD#
			travel_to Time.local(1990)
		end

			it "a User was born on 1845 (Age: 55)" do
				valid_user = build(:user, birthdate: "01/01/1845")
				expect(valid_user).to be_valid
			end
			
			it "a User was born on 1980 (Age: 10)" do
				non_valid_user = build(:user, birthdate: "01/01/1980")
				expect(non_valid_user).to_not be_valid
			end

			it "a User register a day after being 18 (Age: 17)" do
				non_valid_user = build(:user, birthdate: "02/05/1972")
				expect(non_valid_user).to_not be_valid
			end

			it "a User register the day he turns 18 (Age: 18)" do
				valid_user = build(:user, birthdate: "03/05/1972")
				expect(valid_user).to be_valid
			end

		after do
			travel_back
		end
	
	end

end