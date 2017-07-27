class StaticPagesController < ApplicationController
  def home
  	 if logged_in?
      @twitterpost  = current_user.twitterposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end


  def about
  end


def contact
end

end
