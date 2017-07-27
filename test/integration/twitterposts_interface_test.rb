require 'test_helper'

class TwitterpostsInterfaceTest < ActionDispatch::IntegrationTest

	def setup
    @user = users(:michael)
  	end

  	test "twitterpost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Twitterpost.count' do
      post twitterposts_path, params: { twitterpost: { content: "" } }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    content = "This twitterpost really ties the room together"
    assert_difference 'Twitterpost.count', 1 do
      post twitterposts_path, params: { twitterpost: { content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # Delete post
    assert_select 'a', text: 'delete'
    first_twitterpost = @user.twitterposts.paginate(page: 1).first
    assert_difference 'Twitterpost.count', -1 do
      delete twitterpost_path(first_twitterpost)
    end
    # Visit different user (no delete links)
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end




  # test "the truth" do
  #   assert true
  # end
end
