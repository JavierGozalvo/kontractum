class ContractsController < ApplicationController
  before_action :set_contract, only: %i[ show edit update destroy ]

  # GET /contracts or /contracts.json
  def index
    

    @q = Contract.ransack(params[:q])
    @contracts = @q.result(distinct: true)
    #@contracts = Contract.all
    #@contracts = @contracts.by_title(params[:title]) if params[:title].present?
    #@contracts = @contracts.by_payable(params[:payable]) if params[:payable].present?
    # @contracts = @contracts.by_beneficiary(current_user.id) if params[:user_kind].present? && params[:user_kind] == "false"
    

    
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

    @contract.beneficiary = User.find(contract_params[:beneficiary].to_i)
    
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
      params.require(:contract).permit(:title, :desc, :kind, :status, :payable, :sender, :beneficiary)
    end

    def update_params
      contract_params.except(:beneficiary)
    end
end
