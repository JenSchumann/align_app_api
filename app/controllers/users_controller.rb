class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_token, except: [:login, :create]
  before_action :authorize_user, except: [:login, :create, :index]

  # user login
  def login
    puts '--- LOGIN ---'
    #########NEED TO COMMENT THIS OUT WHEN DONE W/TDD:
    puts username: params[:user][:username]
    puts password: params[:user][:password]

    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      token = create_token(user.id, user.username)
      # token: token, should go between status and user
      render json: {status: 200, token: token, user: user}
    else
      render json: {status: 401, message: "Unauthorized - Login"}
    end
  end


  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private


    def create_token(id, username)
      JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def payload(id, username)
    {
      # exp: (1.day.from_now).to_i,

      exp: (Time.now + 30.minutes).to_i,
      iat: Time.now.to_i,
      iss: ENV['JWT_ISSUER'],
      user: {
        id: id,
        username: username
      }
    }
    end



    # Only allow a trusted parameter "white list" through.
    def user_params
      # params.require(:user).permit(:username, :password_digest, :grade, :interests, :strengths, :aspirations, :date)

      params.require(:user).permit(:username, :password, :password_digest)
    end
end
