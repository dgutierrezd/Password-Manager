class AccountsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @accounts = current_user.accounts
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def create
    @article = current_user.accounts.create(account_params)

    redirect_to @account
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = current_user.accounts.find(params[:id])
    @account.update!(account_params)

    redirect_to @account
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy!

    redirect_to accounts_path
  end

  private

  def account_params
    params.require(:account).permit(:username, :account_name, :password)
  end
end
