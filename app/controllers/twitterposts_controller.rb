class TwitterpostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @twitterpost = current_user.twitterposts.build(twitterpost_params)
    if @twitterpost.save
      flash[:success] = "Twitterpost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end


  def destroy
  end

  private

    def twitterpost_params
      params.require(:twitterpost).permit(:content)
    end
end