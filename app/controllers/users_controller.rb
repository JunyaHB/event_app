class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only:[:edit, :update]}  

  def index
    @users = User.all
  end
  
  def show
     @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], 
#    email: params[:email],
    introduction: params[:introduction],
    image_name: "default_user.png",
    password: params[:password]
    )
    
    @code = Code.find_by(id: 1)
#    @code = Code.new(password: params[:password1])
    
    if @user.save && @code.authenticate(params[:password1])
#    if @user.save && @code.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.introduction = params[:introduction]
    
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(name: params[:name])
    @code = Code.find_by(id: 1)
    if @user && @user.authenticate(params[:password]) && @code.authenticate(params[:password1])
      session[:user_id] = @user.id 
      flash[:notice] = "ログインしました"
      redirect_to("/events/index")
    else
      # @error_messageを定義してください
       @error_message = "メールアドレスまたはパスワードが間違っています"
      # @emailと@passwordを定義してください
       @name = params[:name]    
       @password = params[:password]    
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  def joins
    now = Time.current
    yesterday = now.yesterday
    @user = User.find_by(id: params[:id])
    @future_event = Event.all.where("date > ?", yesterday)
    @joins = Join.where(user_id: @user.id)    

  end

#  def joined
#    now = Time.current
#    yesterday = now.yesterday
#    @user = User.find_by(id: params[:id])
#    @past_event = Event.all.where("date < ?", now)
#    @joins = Join.where(user_id: @user.id)    
#  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/events/index")
    end
  end  

end
