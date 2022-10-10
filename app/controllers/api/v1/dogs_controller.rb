class Api::V1::DogsController < ApplicationController
  # path http://localhost:3000/api/v1/dogs.json
  def index
    @dogs = Dog.all
    render json: @dogs
  end

  def show
  end

  def create
  end
end
