class DogController < ApplicationController
  def create
    Dog.new(
      user_id: current_user.id,
      name: params["name"],
      age: params["age"],
      breed: params["breed"]
    )
    if dog.save
      render json: dog.as_jason
    else
      render json: ( errors: dog.errors.full_messages ), status: 418
    end
  end
end
