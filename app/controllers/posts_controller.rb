class PostsController < ApplicationController

  before_filter :find_post, except: [:index, :new, :create]

  def title
    # @post = Post.find params[:id]
    render text: @post.title
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.includes(:comments).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.xml { render xml: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show #
    respond_to do |format|
      format.html # /views/posts/show.html.erb
      format.json { render json: @post }
      format.xml { render xml: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
      format.js
    end
  end

  # GET /posts/1/edit
  def edit #
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
        format.js# { render js: "alert('created')" }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update #
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy #
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  protected

  def find_post
    @post = Post.find params[:id]
  end
end