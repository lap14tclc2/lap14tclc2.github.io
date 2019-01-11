class CiphersController < ApplicationController
  def create
    input_string = params[:string]
    position = params[:position].to_i
    result = ceaser_cipher(input_string, position)
    p result
    respond_to do |format|
      format.json { render json: result}
    end
  end
end
