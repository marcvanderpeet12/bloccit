class FavoriteMailer < ApplicationMailer
  default from: "marcvanderpeet@email.com"

  def new_comment(user, post, comment)
 
     # New Headers
     @user = user
     @post = post
     @comment = comment
 
     mail(to: user.email, subject: "New comment on #{post.title}")
   end
end


