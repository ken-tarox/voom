class BookmarksController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @onsenpost  = Onsenpost.find(params[:bookmark][:onsenpost_id])
    @bookmark = @onsenpost.bookmarks.new(user_id: current_user.id, onsenpost_id:@onsenpost.id)
    if @bookmark.save
      flash[:success] = "お気に入りに追加しました"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @onsenpost  = Onsenpost.find(params[:bookmark][:onsenpost_id])
    @bookmark = @onsenpost.bookmarks.find_by(user_id: current_user.id, onsenpost_id:@onsenpost.id)
    if @bookmark.destroy
     flash[:success] = "お気に入りを解除しました"
     redirect_back(fallback_location: root_path)
    end
  end
end
