class Public::CommentsController < ApplicationController
 def create
   #post = Post.find(params[:post_id])
   comment = current_member.comments.new(comment_params)
   #comment.post_id = post.id
   if comment.save
    redirect_to public_post_path(comment.post)
   else
    @error_comment = comment
     redirect_to public_post_path(comment.post)
   end
 end
 
 def destroy
   Comment.find(params[:id]).destroy
   redirect_to public_post_path(params[:post_id])
 end
 
 private
 
 def comment_params
   #byebug
   #params.require(:comment).permit(:cSomment)
   params.permit(:comment, :post_id)
 end
 
end
