class PostsController < ApplicationController
  #before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :destroy_book, except: [:search_book]
    

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def search_book
    @books = Searching.all
  end
  
  def searching
    Searching.destroy_all
    
    url = "https://dapi.kakao.com/v2/search/book?query="
    title = params[:title]
    
    response = RestClient.get(
      URI.encode("#{url}#{title}&target=title"),
      headers = {
        Authorization: "KakaoAK 0ece3905d8f77f25e847d67c939ec3cb" 
      }
    )
    
    @datas = JSON.parse(response)
    
    @datas["documents"].each do |data|
      Searching.create(
        title: data["title"],
        authors: data["authors"],
        thumbnail: data["thumbnail"],
        category: data["category"],
        contents: data["contents"]
        )
    end
    redirect_to :back
  end
  
  def show_book
    @title = params[:title]
    @authors = params[:authors]
    @thumbnail = params[:thumbnail]
    @category = params[:category]
    @contents = params[:contents]
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_post
    #   @post = Post.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :authors, :thumbnail,:category, :user_id)
    end

    def destroy_book
      Searching.destroy_all
    end
end
