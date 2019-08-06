class PagesController < ApplicationController
  def team; end

  def contact; end

  def welcome
  	@user = params[:first_name]
  end

  def home
  	@potins = Gossip.all
  end

  def show
  	@self = Gossip.find(params[:id])
  end

  def show_user
  	@self_potin = Gossip.find(params[:id])
  	@self = @self_potin.user
  end
end
