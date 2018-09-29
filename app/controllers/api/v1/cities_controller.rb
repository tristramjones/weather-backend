module Api
  module V1
    class CitiesController < ApplicationController

      def index
        @cities = City.all
        render json: @cities
      end

      def show
        @city = City.find(params[:id])
        render json: @city, status: 200
      end

      def new
        @city = City.new
      end

      def create
        @city = City.create(city_params)
        render json: @city, status: 201
      end

      def destroy
        @city = City.find(params[:id])
        @city.destroy
        render json: City.all
      end

      private

      def city_params
        params.require(:name).permit(:name)
      end

    end
  end
end
