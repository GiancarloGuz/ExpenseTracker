class Admin::BanksController < AdminController
  before_action :set_bank, only: [:show, :edit, :update, :destroy]

  def index
    @banks = Bank.all
  end

  def show
  end

  def new
    @bank = Bank.new
  end

  def edit
  end

  def create
    @bank = Bank.new(banks_params)
    if @bank.save
      redirect_to admin_banks_path, notice: "The Bank was successfully created."
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @bank.update(banks_params)
        format.html { redirect_to admin_banks_path, notice: "The Bank was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    if @bank.destroy
      redirect_to admin_banks_path, notice: "The Bank was successfully deleted."
    else
      redirect_to admin_banks_path, alert: "The Bank couldn't be deleted."
    end
  end

  private
    def set_bank
      @bank = bank.find(params[:id])
    end

    def banks_params
      params.require(:bank).permit(:name)
    end
end