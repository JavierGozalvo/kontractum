require "rails_helper"

RSpec.describe ContractsController, type: :routing do
  let(:new_user){
    create(:user)
  }
  describe "routing" do
    it "routes to #index" do
      #sign_in new_user
      expect(get: "/users/1/contracts").to route_to("contracts#index", user_id: "1")
    end

    it "routes to #new" do
      expect(get: "users/1/contracts/new").to route_to("contracts#new", user_id: "1")
    end

    it "routes to #show" do
      expect(get: "users/1/contracts/1").to route_to("contracts#show",user_id: "1", id: "1")
    end

    it "routes to #edit" do
      expect(get: "users/1/contracts/1/edit").to route_to("contracts#edit", user_id: "1", id: "1")
    end


    it "routes to #create" do
      expect(post: "users/1/contracts").to route_to("contracts#create", user_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "users/1/contracts/1").to route_to("contracts#update",user_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "users/1/contracts/1").to route_to("contracts#update", user_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "users/1/contracts/1").to route_to("contracts#destroy", user_id: "1", id: "1")
    end
  end
end
