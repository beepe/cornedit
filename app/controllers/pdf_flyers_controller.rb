class PdfFlyersController < ApplicationController
  
  
  # GET /pdf_flyers
  # GET /pdf_flyers.json
  def index
    @pdf_flyers = PdfFlyer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pdf_flyers }
    end
  end

  # GET /pdf_flyers/1
  # GET /pdf_flyers/1.json
  def show
    @pdf_flyer = PdfFlyer.find(params[:id])
    @path_to_pdf = File.join '../pdf',@pdf_flyer.filename
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pdf_flyer }
    end
  end

  # GET /pdf_flyers/new
  # GET /pdf_flyers/new.json
  def new
    @pdf_flyer = PdfFlyer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pdf_flyer }
    end
  end

  # GET /pdf_flyers/1/edit
  def edit
    @pdf_flyer = PdfFlyer.find(params[:id])
  end

  # POST /pdf_flyers
  # POST /pdf_flyers.json
  def create
    ## check that we don't already have one with that name.
    myfilename = params[:pdf_flyer]['load_pdf_file'].original_filename
    check_flyer = PdfFlyer.find_by_filename(myfilename)
    if check_flyer
      respond_to do |format|
        format.html { redirect_to pdf_flyers_url, alert: 'Pdf flyer '+myfilename+' already exists! (id '+check_flyer.id.to_s+')' }
      end
    else
    
      @pdf_flyer = PdfFlyer.new(params[:pdf_flyer])
      respond_to do |format|
        if @pdf_flyer.save
          format.html { redirect_to pdf_flyers_url, notice: 'Pdf flyer '+@pdf_flyer[:filename]+' was successfully uploaded and created.'}
          format.json { render json: @pdf_flyer, status: :created, location: @pdf_flyer }
        else
          format.html { render action: "new" }
          format.json { render json: @pdf_flyer.errors, status: :unprocessable_entity }
        end
      end
      
    end
  end

  # PUT /pdf_flyers/1
  # PUT /pdf_flyers/1.json
  def update
    @pdf_flyer = PdfFlyer.find(params[:id])

    respond_to do |format|
      if @pdf_flyer.update_attributes(params[:pdf_flyer])
        format.html { redirect_to @pdf_flyer, notice: 'Pdf flyer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pdf_flyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pdf_flyers/1
  # DELETE /pdf_flyers/1.json
  def destroy
    @pdf_flyer = PdfFlyer.find(params[:id])
    myname = @pdf_flyer[:filename]
    @pdf_flyer.destroy

    respond_to do |format|
      format.html { redirect_to pdf_flyers_url, notice: 'Pdf flyer '+myname+' was deleted.' }
      format.json { head :ok }
    end
  end
end
