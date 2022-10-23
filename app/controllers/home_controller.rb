class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
    @q = Contract.ransack(params[:q])
    @contracts = @q.result(distinct: true)
    @contracts = @contracts.order(:created_at).page params[:page]
    # @contracts = Contract.all
    # @contracts = @contracts.by_title(params[:title]) if params[:title].present?
    # @contracts = @contracts.by_payable(params[:payable]) if params[:payable].present?
    @contracts = @contracts.by_owner(params[:q][:owner]) if params.dig(:q, :owner).present?
    @contracts = @contracts.by_beneficiary(params[:q][:beneficiary]) if params.dig(:q, :beneficiary).present?
    @contracts = @contracts.by_status(params[:q][:status]) if params.dig(:q, :status).present?
  end

end
