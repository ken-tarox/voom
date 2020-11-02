class OnsenpostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @search_params = onsen_search_params
    @onsenposts = Onsenpost.paginate(page: params[:page], per_page: 6).search(@search_params)
  end

  def show
    @onsenpost = Onsenpost.find(params[:id])
    @onsenposts = Onsenpost.paginate(page: params[:page], per_page: 5).search(@search_params)
    @comments = @onsenpost.comments.paginate(page: params[:page], per_page: 3)
    @comment = Comment.new
    @bookmarks = @onsenpost.bookmarks
    @bookmark = Bookmark.new

    if @comments.blank?
      @average_rate = 0
    elsif @comments.average(:rate).nil?
      @average_rate = 0
    else
    @average_rate= @comments.average(:rate).round(1)
    end
  end

  def create
    @onsenpost = current_user.onsenposts.build(onsenpost_params)
    if @onsenpost.save
      flash[:success] = "マイ温泉を登録しました！レビューを描いてみましょう"
      redirect_to @onsenpost
    else
      @feed_items = []
      @bookmark_list = []
      @onsenposts = []
      render 'static_pages/home'
    end
 end

 def destroy
   @onsenpost.destroy
   flash[:success] = "指定のマイ温泉を削除しました"
   redirect_to onsenposts_path
 end

 def bookmarks
    @onsenposts = current_user.bookmark_onsenposts.includes(:user).recent
end

 private

    def onsenpost_params
      params.require(:onsenpost).permit(:picture, :kind,:kind_b,:kind_c,:kind_d, :onsen_name, :address, :prefecture, :latitude, :longitude, :average_rate)
    end

    def correct_user
      @onsenpost = current_user.onsenposts.find_by(id: params[:id])
      redirect_to root_url if @onsenpost.nil?
    end


    def onsen_search_params
    params.fetch(:search, {}).permit(:onsen_name, :kind, :kind_b,:kind_c, :kind_d, :address, :prefecture)
  end
end
