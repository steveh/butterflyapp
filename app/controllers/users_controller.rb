class UsersController < ApplicationController

  def index
    head :ok
  end

  def show
    @user = User.find_by_username!(params[:username])

    @likes = @user.services.collect do |service|
      begin
        Rails.cache.fetch("u-#{@user.id}-#{service.id}", :expires_in => (30 + Kernel.rand(30)).minutes) do
          service.provider.likes.sort_by{ |like| like.created_at }.reverse[0...10]
        end
      rescue => exception
        Rails.logger.error("Failed to fetch #{service.name}: #{exception.message}")
        []
      end
    end.flatten.sort_by{ |like| like.created_at }.reverse

    respond_to do |format|
      format.json { render :json => @likes, :callback => params[:callback] }
    end
  end

end