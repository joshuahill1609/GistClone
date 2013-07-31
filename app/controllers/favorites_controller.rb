class FavoritesController < ApplicationController

   def index

   end

  def create
    params[:favorite] = {}
    params[:favorite][:gist_id] = params[:gist_id]
    params[:favorite][:user_id] = current_user.id

    @favorite = Favorite.create!(params[:favorite])

    respond_to do |format|
      format.json { render :json => @favorite.to_json }
    end
  end

  def destroy
    @favorite = Favorite.find_by_gist_id(params[:gist_id])
    @favorite.destroy
    respond_to do |format|
      format.json { render json: @favorite.to_json }
    end
  end

end