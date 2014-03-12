class ChickenController < ApplicationController
  before_filter :check_login, :except => [:index, :grafico_ovos_total]
  before_filter :load

  def load
    @chickens = Chicken.all
    @eggs = Egg.all
  end

  def check_login
    if current_user.nil?
      flash[:error] = 'Voce precisa estar logado'
      redirect_to '/'
    end
  end

  def new
  end

  def create
    @chicken = Chicken.create(params[:chicken])

    if @chicken.save
      flash[:success] = "Galinha adicionada!!!"
      redirect_to '/'
    else
      flash[:error] = "Dados invalidos!!!"
      redirect_to '/'
    end
  end

  def update
    @chicken = Chicken.find(params[:chicken][:id])
    @chicken.update_attributes(params[:chicken])

    if @chicken.save
      flash[:success] = "Galinha editada!!!"
    else
      flash[:error] = ex.message
    end
      redirect_to '/'
  end

  def destroy
    begin
      @chicken = Chicken.find(params[:chicken_id])
      @chicken.destroy
      render :json => {:status => 'success'}
    rescue StandardError => ex
      render :json => {:status => ex.message}
    end
  end

  def index
  end

  def grafico_ovos_total
    render :layout => false
  end
end
