class TwitterpostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
   before_action :correct_user,   only: :destroy

   def create
    @twitterpost = current_user.twitterposts.build(twitterpost_params)
    if @twitterpost.save
      flash[:success] = "Twitterpost created!"
      redirect_to root_url
    else
      @feed_items = []  
      render 'static_pages/home'
    end
  end


  def destroy
    @twitterpost.destroy
    flash[:success] = "Twitterpost deleted"
    redirect_to request.referrer || root_url
  end

  private

    def twitterpost_params
       params.require(:twitterpost).permit(:content, :picture)
    end

    def correct_user
      @twitterpost = current_user.twitterposts.find_by(id: params[:id])
      redirect_to root_url if @twitterpost.nil?
    end


end
