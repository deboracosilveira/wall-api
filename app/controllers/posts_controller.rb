class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]

  def index
    posts = Post.order('created_at DESC')
    render json: { data: ActiveModel::Serializer::CollectionSerializer.new(posts, each_serializer: PostSerializer) },
    status: :ok
  end

  def create
    post = Post.new(post_params)
    post.user = current_user

    if post.save
      render json: { data: PostSerializer.new(post) }, status: :ok
    else
      render json: {
        errors: { message: "Post couldn't be created successfully. #{post.errors.full_messages.to_sentence}" },
      }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :user)
  end
end