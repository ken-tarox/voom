class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy, :show, :my_onsenposts, :bookmarked_onsenposts]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:index, :destroy]

  def index
     @users = User.paginate(page: params[:page], per_page: 3)
  end

  def my_onsenposts
    @user = User.find_by(id: params[:user_id])
    @onsenposts = @user.onsenposts.paginate(page: params[:page], per_page: 16)
  end

  def bookmarked_onsenposts
    @user = User.find_by(id: params[:user_id])
    @bookmarks= Bookmark.where(user_id: @user).pluck(:onsenpost_id)
    @bookmark_list = Onsenpost.find(@bookmarks)
  end

  def show
    @user = User.find(params[:id])
    @onsenposts = @user.onsenposts.paginate(page: params[:page], per_page: 6)
    @bookmarks= Bookmark.where(user_id: @user).pluck(:onsenpost_id)
    @bookmark_list = Onsenpost.find(@bookmarks)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "アカウントをアクティベーションするためにEmailを確認してください."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    # @user = User.find(params[:id])
    # @onsenposts = @user.onsenposts.paginate(page: params[:page], per_page: 6)
    @onsenposts = Onsenpost.paginate(page: params[:page], per_page: 5)
  end

  def update
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除したました"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :content, :picture)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user && current_user.admin?
    end
end
