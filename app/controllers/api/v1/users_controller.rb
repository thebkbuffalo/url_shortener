class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    data = []
    @users.each do |user|
      json_user = user.as_json
      json_user['links'] = user.links
      data.push(json_user)
    end
    respond_to do |f|
      f.json {render json: {users: data}}
    end
  end

  def show
    @user = User.find(params[:id])
    @json_user = @user.as_json
    @json_user['links'] = @user.links
    respond_to do |f|
      f.json {render json: {user: @json_user}}
    end
  end
end
