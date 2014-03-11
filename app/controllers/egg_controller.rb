class EggController < ApplicationController
  before_filter :check_login

  def check_login
    if current_user.nil?
      flash[:error] = 'Voce precisa estar logado'
      redirect_to '/'
    end
  end

  def put
      @chicken = Chicken.find(params[:id])
      @egg = @chicken.eggs.create(:chicken_id => params[:id])
      if @egg.save
        render :json => {:status => 'success'}
      else
        render :json => {:status => 'error'}
      end
  end

  def eat
    @chicken = Chicken.find(params[:id])
    if Egg.find_all_by_chicken_id(@chicken.id).length > 0
      Egg.find_all_by_chicken_id(@chicken.id).last.destroy
      render :json => {:status => 'success'}
    else
      render :json => {:status => 'error'}
    end
  end
end
