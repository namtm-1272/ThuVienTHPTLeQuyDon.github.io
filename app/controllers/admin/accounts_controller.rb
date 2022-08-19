class Admin::AccountsController < Admin::BaseController
    def index
      @pagy, @accounts = pagy(User.all, items: 10)
    end

    def show
      @account = User.find_by id: params[:id]
    end

    def new
        @account = User.new
    end

    def update
      @account = User.find(account_params[:id])
      if (@account.update(account_params))
        flash[:success] = "Successed"
        render "admin/accounts/show"
      else 
        flash[:alert] = "Something was wrong"
        render "admin/accounts/show"

      end
    end

    def create
      @account = User.new(account_params)
      if @account.save
        flash[:success] = "Successed"
        render :new
      else
          flash[:danger] = "No Successed"
          render :new
      end
    end

    def destroy
      @account = User.find_by id: params[:id]
      if @account.destroy
        flash[:success] = "success"
      else
        flash[:danger] = "danger"
      end
      redirect_to admin_accounts_path
    end

    def account_params
      params.require(:account).permit(:id, :Tk, :password, :name, :birthday, :email, :role, :id_lop)
    end

  end
