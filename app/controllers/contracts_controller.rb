class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :destroy]

  def index
    @contracts = Contract.all
  end

  def show
  end

  def new
    @contract = Contract.new
  end

  def edit
    @contract.due_date = @contract.due_date.to_datetime
  end

  def create
    @contract = Contract.new(contract_params)

    if @contract.save
      redirect_to @contract, notice: 'Contract was successfully created.'
    else
      render :new
    end
  end

  def update
    updated = Contract.new(contract_params)
    updated.id = params[:id]
    if updated.save
      redirect_to updated, notice: 'Contract was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contract.destroy
    redirect_to contracts_url, notice: 'Contract was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(:title, :description, :due_date, :showroom_id)
    end
end
