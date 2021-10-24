class ComponentFunctionTestsController < ApplicationController
  def show
    @component_function_test = ComponentFunctionTest.find(params[:id])
  end

  def new
    @component_function_test = ComponentFunctionTest.new
    @function_test = FunctionTest.find(params[:function_test_id])
  end

  def create
    @component_function_test = ComponentFunctionTest.new(component_function_test_params)
    @function_test = FunctionTest.find(params[:function_test_id])
    @component_function_test.function_test = @function_test
    if @component_function_test.save
      redirect_to root_path, notice: "Component Function test successfully created."
    else
      render :new
    end
  end

  def edit
    @component_function_test = ComponentFunctionTest.find(params[:id])
  end

  def update
    if @component_function_test.update(component_function_test_params)
      redirect_to @function_test
    else
      render :edit
    end
  end

  def destroy
    @component_function_test = ComponentFunctionTest.find(params[:id])
    @component_function_test.destroy
    redirect_to bop_path
  end


  private

  def component_function_test_params
    params.require(:component_function_test).permit(:function_test_id,:bop_element_unit,
                                                    :open_gallons, :open_time,
                                                    :close_gallons, :close_time)
  end
end
