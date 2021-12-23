class AdoptionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def new

  end

  def create

  end
end
