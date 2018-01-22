class InstitutionsController < ApplicationController

  def new
    @institution = Institution.new
  end

  def create
    @institution = Institution.create(institution_params)

    if @institution

    end
  end

  def edit

  end

  private

  def institution_params
    params.require(:institution).permit(:name, :subdomain, :first_name, :last_name, :email, :password, :password_confirmation)
  end
end
