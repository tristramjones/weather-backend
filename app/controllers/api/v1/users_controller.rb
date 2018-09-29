module Api
  module V1
    class UsersController < ApplicationController

      def index
        @users = User.all.map{|user| {user: user.name, id: user.id, cities: user.cities}}
        render json: @users
      end

      def show
        @user = User.find(params[:id])
        @user_obj = {user: @user.name, id: @user.id, cities: @user.cities}
        render json: @user_obj, status: 200
      end

      def new
        @user = User.new
      end

      def create
        @user = User.create(user_params)
        render json: @user, status: 201
      end

      def edit
        @user = User.find(params[:id])
      end

      def update
        @user = User.find(params[:id])
        @user.update(user_params)
        render json: @user
      end

      private

      def user_params
        params.require(:name).permit(:name)
      end

    end
  end
end
