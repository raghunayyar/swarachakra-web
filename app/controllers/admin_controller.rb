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
  	@languages = Language.new
  end

  def show
    @languages = Language.find(params[:id])
  end

  # Request : POST
  # URI : /admin/upload
  def upload
    # TODO: Redirect only if request is succesful.
    csv = params[:language][:file]
    File.open(Rails.root.join('uploads', 'languages', csv.original_filename), 'wb') do |file|
      file.write(csv.read)
      @languages = Language.new(upload_params) do |t|
          t.name  = csv.original_filename
          t.path = 'blah'
          t.enabled = true
      end
      if @languages.save
        redirect_to action: 'dashboard'
      else
        redirect_to 'new'
      end
    end
  end

  # Request : DELETE
  # URI : /admin/destroy
  def destroy
    @languages = Language.find(params[:id])
    @languages.destroy
    redirect_to 'dashboard'
  end
  private
    def upload_params
      params.require(:language).permit(:name, :path, :enabled)
    end
end
