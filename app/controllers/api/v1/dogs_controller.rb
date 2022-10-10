class Api::V1::DogsController < ApplicationController
  def index
  end

  def show
  end

  def create
    render json :@dog, status: :created, location: api_v1_dog_path(@dog)
  end
end
