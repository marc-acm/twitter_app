class StaticPagesController < ApplicationController
  def home
  	  @twitterpost = current_user.twitterposts.build if logged_in?
  end

  def help
  end


  def about
  end


def contact
end

end
