class MessagesController < ApplicationController
  def show
    @name = params[:name].titleize if params[:name]
  end
end
