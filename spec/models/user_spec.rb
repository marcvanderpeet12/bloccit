require 'rails_helper'
 
 describe User do
 
   include TestFactories
   
    before do 
      @user = create(:user)
      @post = create(:post)
    end

   describe "#favorited(post)" do
     it "returns `nil` if the user has not favorited the post" do
      expect( @user.favorited(@post) ).to eq(nil)
     end
 
     it "returns the appropriate favorite if it exists" do
      favorite = @user.favorites.where(post: @post).create
      expect( @user.favorited(@post) ).to eq(favorite)
     end
   end

   describe ".top_rated" do
 
     it "returns users ordered by comments + posts" do
       expect( User.top_rated ).to eq([@user2, @user1])
     end
 
     it "stores a `posts_count` on user" do
       users = User.top_rated
       expect( users.first.posts_count ).to eq(1)
     end
 
     it "stores a `comments_count` on user" do
       users = User.top_rated
       expect( users.first.comments_count ).to eq(2)
     end
   end
 end