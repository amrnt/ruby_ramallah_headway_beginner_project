class CommentsController < ApplicationController
  def index
    # /posts/:post_id/comments(.:format)
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def create
    # /posts/:post_id/comments(.:format)
    @post = Post.find(params[:post_id])
    # @post.comments.create(params[:comment])

    @comment = @post.comments.new(params[:comment]) # new comment object with post_id = params[:post_id]
    if @comment.save
      redirect_to post_comments_path(@post)
    else
      #whatever msg
    end
  end
end
