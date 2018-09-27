module Api
  module V1
    class UsersController < ApplicationController

      def index
        @users = User.all.map{|user| {user: user.name, id: user.id, cities: user.cities}}
        render json: @users
      end

      def create
        @user = User.create(user_params)
        render json: @user, status: 201
      end

      def show
        @user = User.find(params[:id])
        render json: @user, status: 200
      end

      private

      def user_params
        params.permit(:name)
      end

    end
  end
end
