class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]

  def index
    posts = Post.order('created_at DESC')
    render json: { data: posts }, status: :ok
  end

  def create
    post = Post.new(post_params)
    post.user = current_user

    if post.save
      render json: { data: PostSerializer.new(post).serializable_hash }, status: :ok
    else
      render json: {
        errors: { message: "Post couldn't be created successfully. #{post.errors.full_messages.to_sentence}" },
      }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.permit(:content)
  end
end