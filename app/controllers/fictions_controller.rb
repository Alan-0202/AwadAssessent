class FictionsController < ApplicationController
  before_action :set_fiction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /fictions
  # GET /fictions.json
  def index

    # one request coin -1
    if current_user.account < 1
      no_coins
    else

      current_user.account = current_user.account - 1

      currentid = current_user.id
      onepay = Purchase.create(:user_id => currentid, :info => "Fictions Request", :pay => 1)
      onepay.save
      current_user.save
      @fictions = Fiction.order('name')
      @fictionread = []
      @fictionprice = []
      length = @fictions.size
      (1..length).each  { |i|
        item = @fictions.find(i)
        @fictionread.push(item.reviews)
        @fictionprice.push(item.price)

      }



    end


  end


  # GET /fictions/1
  # GET /fictions/1.json
  def show

    not_found
  end

  # GET /fictions/new
  def new
    @fiction = Fiction.new
  end

  # GET /fictions/1/edit
  def edit
  end



  # POST /fictions
  # POST /fictions.json
  def create
    @fiction = Fiction.new(fiction_params)

    respond_to do |format|
      if @fiction.save
        format.html { redirect_to @fiction, notice: 'Fiction was successfully created.' }
        format.json { render :show, status: :created, location: @fiction }
      else
        format.html { render :new }
        format.json { render json: @fiction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fictions/1
  # PATCH/PUT /fictions/1.json
  def update
    respond_to do |format|
      if @fiction.update(fiction_params)
        format.html { redirect_to @fiction, notice: 'Fiction was successfully updated.' }
        format.json { render :show, status: :ok, location: @fiction }
      else
        format.html { render :edit }
        format.json { render json: @fiction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fictions/1
  # DELETE /fictions/1.json
  def destroy
    @fiction.destroy
    respond_to do |format|
      format.html { redirect_to fictions_url, notice: 'Fiction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fiction
      @fiction = Fiction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fiction_params
      params.require(:fiction).permit(:name, :author, :reviews, :price, :year)
    end
end
