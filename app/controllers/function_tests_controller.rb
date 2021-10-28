class FunctionTestsController < ApplicationController

  before_action :set_function_test, only: [:show, :edit, :update, :destroy, :approve]

  def index
    @function_tests = FunctionTest.all
  end

  def show
  end

  def new
    @function_test = FunctionTest.new
    @bop = Bop.find(params[:bop_id])

    Question.all.each do |q|
      @function_test.function_test_answers.build
    end
  end

  def create
    @function_test = FunctionTest.new(function_test_params)
    @bop = Bop.find(params[:bop_id])

    @function_test.bop = @bop
    @function_test.last_test_date = @bop.last_completed_function_test_date

    @function_test.next_test_deadline = @function_test.completed_date + 21.day
    @function_test.user = current_user

    if @function_test.save
      @function_test.function_test_answers.build
      redirect_to function_test_path(@function_test), notice: "function test successfully created."
    else
      render :new
    end
  end

  private

  def set_function_test
    @function_test = FunctionTest.find(params[:id])
  end

  def function_test_params
    params.require(:function_test).permit(:completed_date, :location, :well_name,
                                          component_function_tests_attributes:[:id, :function_test_id,:bop_element_unit,
                                                    :open_gallons, :open_time, :close_gallons, :close_time, :photo, :_destroy],
                                          function_test_answers_attributes: [:question_id, :value],
                                          )
  end

end
