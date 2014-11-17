class CompaniesController < ApplicationController

  def index

  end

  def show
    @companies_id = params[:id]
  end

end
