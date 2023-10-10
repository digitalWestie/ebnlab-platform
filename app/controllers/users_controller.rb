class UsersController < ApplicationController
  before_action :authenticate_user!, except: []

  def search
    search_term = params[:email]
    results = User.where("email LIKE ?", "%#{search_term}%").pluck(:email, :id)
    render json: results.collect { |arr| h = { email: arr[0], id: arr[1] } }
  end

end