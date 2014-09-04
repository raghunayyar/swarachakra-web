class AdminController < ApplicationController

  # Request : GET
  # URI : /admin/dashboard
  # Use : Displays table of CSVs. 
  def dashboard
    @languages = Language.all
  end

  # Request : GET
  # URI /admin/dashboard
  # Use : Page to upload new CSV
  def new
  	# @csv = Admin.new
  end

  # Request : POST
  # URI : /admin/upload
  def upload
    # TODO: Redirect only if request is succesful.
    uploaded_io = params[:file]
    File.open(Rails.root.join('uploads', 'languages', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    redirect_to action: 'dashboard'
  end
end
