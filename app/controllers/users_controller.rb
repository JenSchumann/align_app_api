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
      render json: {status: 200, token: token, user: user}
    else
      render json: {status: 401, message: "Unauthorized - Login"}
    end
  end


  # GET /users: if admin functionality isn't built for version 1 this needs to be commented out
  def index
    @users = User.all

    render json: @users
    #need to set up for admin use, active now only for production:
    # render json: @users.to_json(include: :plans)
  end

  # GET /users/1
    def show
        render json: @user
      # @users = User.find(params[:id])

      # render json: @user.to_json(include: :plans)
    end



  # def show
  #   render json: @user

    # render json: @user.to_json(include: :plans)

    ####trash the rest of this if
    #trying to get user profile upon login..not sure if this is where to:
    # need to change to waht is in plans lines 6-8?
    # below is creating loop
    # @user = User.find(params[:id])
  #   if @user
  #   render json: @user.to_json(include: :plans)
  # else
  #   render json: @user.errors, status: :unprocessable_entity
  # end
# end

  # POST /users
  def create
    # @user = User.new(user_params, plan_params)
    @user = User.new(user_params)

    if @user.save
      # render json: @user.to_json(include: :plans), status: :created
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)

      #does plans attached to user need to be included to stay attached once a user updates their profile?
      render json: @user
      puts 'align backend updating user'
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    puts 'learner destroying their align account - backend talking'
    #does plans attached to user need to be included to stay attached once a user deletes their profile?
    @user = User.find(params[:id])
    @user.destroy
  end

  private


    def create_token(id, username)
      JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
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

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])

    end


    # Only allow a trusted parameter "white list" through.
    def user_params

      params.require(:user).permit(:username, :password, :password_digest, :grade, :interests, :strengths, :aspirations, :date)

    end
end
