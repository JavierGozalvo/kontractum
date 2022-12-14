class ContractsController < ApplicationController
  before_action :set_contract, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /contracts or /contracts.json
  def index
    @q = Contract.ransack(params[:q])
    @contracts = @q.result(distinct: true) 
  end

  def accept
    @contract = Contract.find(params[:contract_id])
    @contract.update(status: :approved)
    
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: "Contract was accepted." }
      format.json { head :no_content }
    end
  end

  def reject
    @contract = Contract.find(params[:contract_id])

    if current_user == @contract.beneficiary
      @contract.destroy
    end
    
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: "Contract was rejected." }
      format.json { head :no_content }
    end
  end

  def modify
    @contract = Contract.find(params[:contract_id])
    @contract.update(status: :modification_requested)

    respond_to do |format|
      format.html { redirect_to request.referrer, notice: "Modification requested to #{@contract.owner.name}" }
      format.json { head :no_content }
    end
  end

  def accept_modification
    @contract = Contract.find(params[:contract_id])
    @contract.update(status: :modification_in_progress)

    respond_to do |format|
      format.html { redirect_to request.referrer, notice: "Contract modification accepted" }
      format.json { head :no_content }
    end
  end

  def reject_modification
    @contract = Contract.find(params[:contract_id])
    @contract.update(status: :archived)

    respond_to do |format|
      format.html { redirect_to request.referrer, notice: "Contract modification rejected" }
      format.json { head :no_content }
    end
  end

  def edited
    @contract = Contract.find(params[:contract_id])
    @contract.update(status: :edited)

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Contract edited sucessfully." }
      format.json { head :no_content }
    end
  end

  def tokenize
    @contract = Contract.find(params[:contract_id])
    @contract.update(status: :tokenization_requested)

    respond_to do |format|
      format.html { redirect_to request.referrer, notice: "Tokenization requested." }
      format.json { head :no_content }
    end
  end

  def accept_tokenization
    @contract = Contract.find(params[:contract_id])
    @contract.update(status: :tokenizable)

    respond_to do |format|
      format.html { redirect_to request.referrer, notice: "Contract tokenization accepted" }
      format.json { head :no_content }
    end
  end

  def reject_tokenization
    @contract = Contract.find(params[:contract_id])
    @contract.update(status: :approved)

    respond_to do |format|
      format.html { redirect_to request.referrer, notice: "Contract tokenization rejected" }
      format.json { head :no_content }
    end
  end

  def tokenizable
    @contract = Contract.find(params[:contract_id])
    if current_user == @contract.owner
      firm_1 = @contract.owner.name
      @contract.update(firm1: firm_1)
    elsif current_user == @contract.beneficiary
      firm_2 = @contract.beneficiary.name
      @contract.update(firm2: firm_2)
    end

    if @contract.firm1 && @contract.firm2
      @contract.update(status: :tokenized)
    end

    respond_to do |format|
      format.html { redirect_to request.referrer, notice: "Contract firmed and uploaded to blockchain!" }
      format.json { head :no_content }
    end
  end

  # GET /contracts/1 or /contracts/1.json
  def show
  end

  # GET /contracts/new
  def new
    @contract = Contract.new
  end

  # GET /contracts/1/edit
  def edit
  end

  # POST /contracts or /contracts.json
  def create
    @contract = Contract.new(contract_params.except(:beneficiary))

    #@contract.beneficiary = User.find(contract_params[:beneficiary].to_i)
    @contract.beneficiary = User.find_by_email(contract_params[:beneficiary])
    
    @contract.owner = current_user

    respond_to do |format|
      if @contract.save
        format.html { redirect_to root_path, notice: "Contract was successfully created." }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1 or /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(update_params)
        format.html { redirect_to root_path, notice: "Contract was successfully updated." }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1 or /contracts/1.json
  def destroy
    if current_user == @contract.owner
      @contract.destroy
    end
    
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Contract was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract

        @contract = Contract.find(params[:id])

    end

    # Only allow a list of trusted parameters through.
    def contract_params
      params.require(:contract).permit(:title, :desc, :kind, :status, :payable, :sender, :beneficiary, :contract_file)
    end

    def update_params
      contract_params.except(:beneficiary)
    end
end
