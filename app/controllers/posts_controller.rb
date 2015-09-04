# encoding: UTF-8
class PostsController < ApplicationController 
include SimpleCaptcha::ControllerHelpers
  before_filter :i_am_admin, except: [:wantdelete,:wrongdata,:newactivity,:complain,:suggest,:show,:new , :create]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
       if current_user.try(:admin?) 
        return
      elsif !flash[:notice]
            redirect_to :root
      end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save_with_captcha
        format.html { redirect_to @post, notice: "تم ارسال ارسالة بنحاج ، و رقم الرسالة هو : #{ @post.id} ، شكراً لتواصلكم معنا ، و سوف يتم مراجهة الرسالة في أقرب و قت." }
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
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def suggest
    @title="نموذج إقتراح:"
    @post = Post.new
  end

  def newactivity
    @title="نموذج إبلاغ عن نشاط جديد أو غير موجود:"
    @post = Post.new
  end

  def wrongdata
    @title="نموذج إبلاغ عن بيانات حاطئة:"
    @post = Post.new
  end

  def complain
    @title="نموذج شكوى من الموقع:"
    @post = Post.new
  end

  def wantdelete
    @title="طلب حذف بيانات:"
    @post = Post.new
  end

  private

  def i_am_admin
    current_user.try(:admin?) 
        return
      else
        raise "ليس من حقك الوصول لهذة الصفحة"
      end
   
  end

  end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name,:cause,:tel, :captcha, :captcha_key, :comment)
    end
end
