require 'test_helper'

class TwitterpostsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @twitterpost = microposts(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Twitterpost.count' do
      post twitterposts_path, params: { twitterpost: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Twitterpost.count' do
      delete twitterpost_path(@twitterpost)
    end
    assert_redirected_to login_url
  end








  # test "the truth" do
  #   assert true
  # end
end
