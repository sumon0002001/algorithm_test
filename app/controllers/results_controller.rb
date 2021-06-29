class ResultsController < ApplicationController
  include ApplicationHelper 
  include ResultsHelper
  before_action :logged_in?

  def new 
    @result = Result.new
  end

  def create
    @get_result = Result.find_by(full_string: params[:full_string], user_id: session[:user_id])
    redirect_to result_path(params[:full_string]) and return if @get_result

    @sub = LongestSubstring(params[:full_string])
    @new_result = Result.new(full_string: params[:full_string], longest_sub: @sub, longest_sub_length: @sub.length, user_id: session[:user_id])
      if @new_result.save
        redirect_to result_path(params[:full_string])
      else
        render :action => "new"
      end
  end

  def show 
    @result = Result.find_by(full_string: params[:string])
    if !@result
      redirect_to root_path, notice: 'OPPS! Something is wrong!!!!'
    end
  end
end
