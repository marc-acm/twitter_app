require 'test_helper'

class TwitterpostTest < ActiveSupport::TestCase
	def setup
    @user = users(:michael)
    @twitterpost = @user.twitterposts.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @twitterpost.va @micropost = @user.microposts.build(content: "Lorem ipsum")lid?
  end

  test "user id should be present" do
    @twitterpost.user_id = nil
    assert_not @twitterpost.valid?
  end

 test "content should be present" do
    @twitterpost.content = "   "
    assert_not @twitterpost.valid?
  end

  test "content should be at most 140 characters" do
    @twitterpost.content = "a" * 141
    assert_not @twitterpost.valid?
  end

  test "order should be most recent first" do
    assert_equal twitterposts(:most_recent), Twitterpost.first
  end

  # test "the truth" do
  #   assert true
  # end
end
