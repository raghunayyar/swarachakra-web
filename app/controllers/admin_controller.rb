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
    csv = params[:file]
    @languages = Language.new(csv) do |t|
        t.name  = @original_filename
        t.path = 'blah'
        t.enabled = false
    end
    if @languages.save
      redirect_to action: 'dashboard'
    else
      redirect_to 'new'
    end
  end
  private
    def upload_params
      params.require(:file).permit(:name, :path, :enabled)
    end
end
