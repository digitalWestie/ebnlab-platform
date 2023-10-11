class UsersController < ApplicationController
  before_action :authenticate_user!, except: []

  def search
    relevant_users = User.joins(:organisations).where('organisations.id' => current_user.organisations)
    search_term = params[:email]
    results = relevant_users.where("email LIKE ?", "%#{search_term}%").pluck(:email, :id)
    render json: results.collect { |arr| h = { email: arr[0], id: arr[1] } }
  end

end