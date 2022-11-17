class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
    @q = Contract.where(owner: current_user).or(Contract.where(beneficiary: current_user)).ransack(params[:q])
    @contracts = @q.result(distinct: true)
    @contracts = @contracts.page(params[:page]).order(created_at: :desc).per(5)
    
    @contracts = @contracts.by_owner(params[:q][:owner]) if params.dig(:q, :owner).present?
    @contracts = @contracts.by_beneficiary(params[:q][:beneficiary]) if params.dig(:q, :beneficiary).present?
    @contracts = @contracts.by_status(params[:q][:status]) if params.dig(:q, :status).present?
  end

end
