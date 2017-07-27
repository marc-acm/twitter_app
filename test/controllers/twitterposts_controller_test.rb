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

  test "should redirect destroy for wrong micropost" do
    log_in_as(users(:michael))
    micropost = microposts(:ants)
    assert_no_difference 'Micropost.count' do
      delete micropost_path(micropost)
    end
    assert_redirected_to root_url
  end






  # test "the truth" do
  #   assert true
  # end
end
