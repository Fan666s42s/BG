class BadguestsController < ApplicationController
  before_action :set_badguest, only: [:show, :edit, :update, :destroy]

  # GET /badguests
  # GET /badguests.json
  def index
    @badguests = Badguest.all
  end

  def search

    badguest_count = Badguest.countBG(params[:search])

    @credit_rank = ((10 - badguest_count)) < 0 ? 1 : (10 - badguest_count)

    
  end

  def history
    @badguests = Badguest.where(store_id: current_store.id)
  end

  # GET /badguests/1
  # GET /badguests/1.json
  def show
  end

  # GET /badguests/new
  def new
    @badguest = Badguest.new
  end

  # GET /badguests/1/edit
  def edit
  end

  # POST /badguests
  # POST /badguests.json
  def create
    @badguest = Badguest.new(badguest_params)
    @badguest.store_id = current_store.id

    respond_to do |format|
      if @badguest.save
        format.html { redirect_to @badguest, notice: 'Badguest was successfully created.' }
        format.json { render :show, status: :created, location: @badguest }
      else
        format.html { render :new }
        format.json { render json: @badguest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /badguests/1
  # PATCH/PUT /badguests/1.json
  def update
    respond_to do |format|
      if @badguest.update(badguest_params)
        format.html { redirect_to @badguest, notice: 'Badguest was successfully updated.' }
        format.json { render :show, status: :ok, location: @badguest }
      else
        format.html { render :edit }
        format.json { render json: @badguest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /badguests/1
  # DELETE /badguests/1.json
  def destroy
    @badguest.destroy
    respond_to do |format|
      format.html { redirect_to badguests_url, notice: 'Badguest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_badguest
      @badguest = Badguest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def badguest_params
      params.require(:badguest).permit(:phone, :desc, :store_id)
    end
end
