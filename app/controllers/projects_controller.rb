class ProjectsController < ApplicationController

  def new
    @projects = Project.new
  end
end
