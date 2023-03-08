class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_devise_api_token!, only: [:user_logged_in]

  def user_logged_in
    render json: { message: true }
  end
end