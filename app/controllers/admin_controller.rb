class AdminController < ApplicationController

  # Request : GET
  # URI : /admin/dashboard
  # Use : Displays table of CSVs. 
  def dashboard
  	@csv = Admin.all
  end

  # Request : GET
  # URI /admin/dashboard
  # Use : Page to upload new CSV
  def new
  	@csv = Admin.new
  end

  # Request : POST
  # URI : /admin/upload
  def upload
  end
end
