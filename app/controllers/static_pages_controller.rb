class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @onsenposts = Onsenpost.paginate(page: params[:page], per_page: 5)
      @onsenpost  = current_user.onsenposts.build
      @comment = current_user.comments.build
      @bookmark = current_user.bookmarks.build
      @feed_items = current_user.feed.paginate(page: params[:page])

      @bookmarks= Bookmark.where(user_id: current_user.id).pluck(:onsenpost_id)
      @bookmark_list = Onsenpost.find(@bookmarks)
    else
      @onsenposts = Onsenpost.paginate(page: params[:page], per_page: 10)
    end
  end
end
