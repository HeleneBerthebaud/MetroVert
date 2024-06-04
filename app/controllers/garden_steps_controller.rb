class GardenStepsController < ApplicationController
  def show
    @garden_step = GardenStep.find(params[:id])
    @step = @garden_step.step
    @tasks = @step.tasks
    @garden = @garden_step.garden
  end
end
