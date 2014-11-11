require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "the project method creates a  project" do
    post :create, project: {name: "Runaway", tasks: "start something:2"}
    assert_equal "Runaway", assigns[:action].project.name 
  end

  test "on failure we go back to the form" do
    post :create, project: { name: "", tasks: ""}
    assert_template :new
    refute_nil assigns(:project)
  end

end
