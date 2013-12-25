class ScrapersController < ApplicationController
  before_action :set_scraper, only: [:show, :edit, :update, :destroy]

  # GET /scrapers
  # GET /scrapers.json
  def index
    @scrapers = Scraper.all
  end

  # GET /scrapers/1
  # GET /scrapers/1.json
  def show
  end

  # GET /scrapers/new
  def new
    @scraper = Scraper.new
  end

  # GET /scrapers/1/edit
  def edit
  end

  # POST /scrapers
  # POST /scrapers.json
  def create
    if params[:scraper][:profile_link].present?
      @profile_link = Linkedin::Profile.get_profile(params[:scraper][:profile_link])
      logger.warn(@profile_link.inspect)
      @scraper = Scraper.new
      @scraper.first_name   =  @profile_link.first_name
      @scraper.last_name    = @profile_link.last_name
      @scraper.name         = @profile_link.name
      @scraper.title        = @profile_link.title
      @scraper.location     = @profile_link.location
      @scraper.industry     = @profile_link.industry
      @scraper.picture      = @profile_link.picture
      @scraper.skills       = @profile_link.skills
      @scraper.organizations = @profile_link.organizations
      @scraper.education    = @profile_link.education
      @scraper.websites     = @profile_link.websites
      @scraper.groups       = @profile_link.groups
      @scraper.languages    = @profile_link.languages
      @scraper.certifications  = @profile_link.certifications
      @scraper.current_companies = @profile_link.current_companies
      logger.warn(@scraper.current_companies.inspect)
      respond_to do |format|
        if @scraper.save
          format.html { redirect_to @scraper, notice: 'Scraper was successfully created.' }
          format.json { render action: 'show', status: :created, location: @scraper }
        else
          format.html { render action: 'new' }
          format.json { render json: @scraper.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:notice] ="Provide Link"
      redirect_to :back
    end
  end

  # PATCH/PUT /scrapers/1
  # PATCH/PUT /scrapers/1.json
  def update
    respond_to do |format|
      if @scraper.update(scraper_params)
        format.html { redirect_to @scraper, notice: 'Scraper was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scraper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scrapers/1
  # DELETE /scrapers/1.json
  def destroy
    @scraper.destroy
    respond_to do |format|
      format.html { redirect_to scrapers_url }
      format.json { head :no_content }
    end
  end

  def get_link
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scraper
      @scraper = Scraper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scraper_params
      params.require(:scraper).permit(:first_name, :last_name, :title, :name, :location, :industry, :picture, :skills, :organizations, :education, :websites, :groups, :languages, :certifications,:current_companies)
    end
end
