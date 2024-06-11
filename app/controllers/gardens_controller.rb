class GardensController < ApplicationController
  before_action :set_garden, only: [:edit, :next_step, :previous_step]
# :update dans only si retour a la normal

  def create
    raise
    @garden = Garden.new(garden_params)
    @garden.user = current_user
    @garden.save
    redirect_to packagechoice_path(@garden)
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
    @garden.current_step = 1
    render :step1
  end

  def edit
    raise
    case @garden.current_step
    when 1
      render :step1
    when 2
      raise
      render :step2
    when 3
      render :step3
    when 4
      render :step4
    else
      redirect_to @garden
    end
  end

  def next_step
    @garden.assign_attributes(garden_params)
    if params[:next]
      @garden.current_step += 1 if @garden.valid?
    elsif params[:back]
      @garden.current_step -= 1 if @garden.current_step > 1
    end

    @garden.save(validate: false)

    case @garden.current_step
    when 1
      render :step1
    when 2
      render :step2
    when 3
      render :step3
    when 4
      render :step4
    else
      redirect_to @garden, notice: 'Garden was successfully created.'
    end
  end

  def previous_step
    @garden.current_step -= 1 if @garden.current_step > 1
    @garden.save(validate: false)

    case @garden.current_step
    when 1
      render :step1
    when 2
      render :step2
    when 3
      render :step3
    when 4
      render :step4
    else
      redirect_to @garden, notice: 'Garden was successfully created.'
    end
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
  end

  def garden_params
    params.require(:garden).permit(:name, :size, :exposition, :address, :photo)
  end
end
