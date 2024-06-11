class GardensController < ApplicationController

  def create
    @garden = Garden.new(garden_params)
    @garden.user = current_user

    if @garden.save
      redirect_to garden_path(@garden), notice: 'Garden was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @mygardens = Garden.all.where(user: current_user)
  end

  def show
    @garden = Garden.find(params[:id])
    @garden_steps = @garden.garden_steps.includes(:step).sort_by { |garden_step| garden_step.step.order }
  end

  def destroy
    @garden = Garden.find(params[:id])
    @garden.destroy
    # No need for app/views/gardens/destroy.html.erb
    redirect_to gardens_path, status: :see_other
  end

  def packagechoice
    @garden = Garden.find(params[:id])
    @packages = Package.where(size: @garden.size)
  end

  def new
    @garden = Garden.new
  end

  private

  def garden_params
    params.require(:garden).permit(:name, :size, :exposition, :address, :photo)
  end
end
