class Front::AccountsController < FrontController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = Account.all
  end

  def show
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def create
    @account = Account.new(accounts_params)
    if @account.save
      redirect_to front_accounts_path, notice: "The Account was successfully created."
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @account.update(accounts_params)
        format.html { redirect_to front_accounts_path, notice: "The Account was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    if @account.destroy
      redirect_to front_accounts_path, notice: "The Account was successfully deleted."
    else
      redirect_to front_accounts_path, alert: "The Account couldn't be deleted."
    end
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end

    def accounts_params
      params.require(:account).permit(:bank_id, :account_number)
    end
end