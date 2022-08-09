require 'rails_helper'

RSpec.describe "/contracts", type: :request do
  let(:new_user){ create(:user) }
  
  let(:beneficiary){ create(:user) }

  let(:valid_attributes){ attributes_for(:contract).merge(beneficiary: beneficiary.id) }

  let(:invalid_attributes) do {
    title: "", 
    desc: "", 
    kind: "", 
    status: :drafted, 
    owner: nil, 
    beneficiary: beneficiary.id, 
    payable: true
  } end

  describe "GET /index" do
    it "renders a successful response" do
      sign_in new_user
      valid_contract = create(:contract)
      get user_contracts_path(valid_contract.owner)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      sign_in new_user
      valid_contract = create(:contract)
      get user_contracts_url(valid_contract)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      sign_in new_user
      valid_contract = create(:contract)
      get new_user_contract_path(valid_contract.owner)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      sign_in new_user
      valid_contract = create(:contract)
      get edit_user_contract_path(valid_contract.owner, valid_contract.id)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Contract" do
        sign_in new_user
        expect {
          post user_contracts_path(new_user), params: { contract: valid_attributes }
        }.to change(Contract, :count).by(1)
      end

      it "redirects to the created contract" do
        sign_in new_user
        post user_contracts_url(new_user), params: { contract: valid_attributes }
        expect(response).to redirect_to(user_contracts_url(new_user))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Contract" do
        sign_in new_user
        expect {
          post user_contracts_path(new_user), params: { contract: invalid_attributes }
        }.to change(Contract, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        sign_in new_user
        post user_contracts_url(new_user), params: { contract: invalid_attributes }
        expect(response).to_not be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do

      let(:new_attributes){ attributes_for(:contract).except(:beneficiary)}

      it "updates the requested contract" do
        sign_in new_user
        valid_contract = create(:contract)
        patch user_contract_url(new_user, valid_contract), params: { contract: new_attributes }
        expect(response.status).to eq(302)
      end

      it "redirects to the contract" do
        sign_in new_user
        valid_contract = create(:contract)
        patch user_contract_url(new_user, valid_contract), params: { contract: new_attributes }
        valid_contract.reload
        expect(response).to redirect_to(user_contracts_path(new_user))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        sign_in new_user
        valid_contract = create(:contract, beneficiary: new_user)
        patch user_contract_url(new_user, valid_contract), params: { contract: invalid_attributes }
        expect(response).to_not be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested contract" do
      sign_in new_user
      valid_contract = create(:contract, owner: new_user)
     
      expect {
        delete user_contract_url(new_user, valid_contract)
        
      }.to change(Contract, :count).by(-1)
    end

    it "redirects to the contracts list" do
      sign_in new_user
      valid_contract = create(:contract)
      delete user_contract_url(new_user, valid_contract)
      expect(response).to redirect_to(user_contracts_path(new_user))
    end
  end
end
