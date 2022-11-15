class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
    @q = Contract.ransack(params[:q])
    @contracts = @q.result(distinct: true)
    @contracts = @contracts.page(params[:page]).order(created_at: :desc).per(22)
    # @contracts = Contract.all
    # @contracts = @contracts.by_title(params[:title]) if params[:title].present?
    # @contracts = @contracts.by_payable(params[:payable]) if params[:payable].present?
    @contracts = @contracts.by_owner(params[:q][:owner]) if params.dig(:q, :owner).present?
    @contracts = @contracts.by_beneficiary(params[:q][:beneficiary]) if params.dig(:q, :beneficiary).present?
    @contracts = @contracts.by_status(params[:q][:status]) if params.dig(:q, :status).present?
  end

end
