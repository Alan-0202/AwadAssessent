class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index

    if current_user.account < 2
      no_coins
    else

      current_user.account = current_user.account - 2

      currentid = current_user.id
      onepay = Purchase.create(:user_id => currentid, :info => "Movies Request", :pay => 2)
      onepay.save
    @movies = Movie.all
    length = @movies.size
    @moviestitle = []
    @moviesrevenue = []

    #get the movie title list for echats
    (1..length).each { |i|
      item = @movies.find(i)
      revenue = item.revenue
      moviename = item.title

      @moviestitle.push(moviename)
      @moviesrevenue.push(revenue)
    }

    end



  end

  # GET /movies/1
  # GET /movies/1.json
  def show

    not_found
  end

  # GET /movies/new
  def new
    @movie = Movie.new

  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:homepage, :overview, :release, :revenue, :title)
    end
end
