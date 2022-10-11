class Api::V1::DogsController < ApplicationController
  # path http://localhost:3000/api/v1/dogs.json
  def index
    if params[:q].present?
      @dogs = Dog.where('breed LIKE ?', "%#{params[:q]}%")
    else
      @dogs = Dog.all
    end
    render json: @dogs, status: 200
  end

  def show
  end

  def create
  end
end
