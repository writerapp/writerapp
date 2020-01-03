class Writers::WritersController < ApplicationController
  before_action :authenticate_writer!
  def show
  	@writer = current_writer
  end
end
