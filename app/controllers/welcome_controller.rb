class WelcomeController < ApplicationController
  def index
    render json: { status: 200, message: "Align API"}
  end
end
