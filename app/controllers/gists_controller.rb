class GistsController < ApplicationController

  respond_to :json
  respond_to :html, only: [:index]

  def index
    query = <<-SQL
    SELECT gists.id, gists.title, users.username, gists.id
      IN (SELECT DISTINCT gists.id
          FROM gists
          JOIN favorites ON gists.id = favorites.gist_id
          WHERE favorites.user_id = #{current_user.id}) AS favorited
    FROM gists
    JOIN users
    ON gists.user_id = users.id
    SQL
    @gists = ActiveRecord::Base.connection.execute(query).to_json

    respond_with @gists
  end

  def create
    params[:gist][:user_id] = current_user.id
    @gist = Gist.create!(params[:gist])

    respond_with @gist
  end

  def update

  end

  def destroy

  end

end