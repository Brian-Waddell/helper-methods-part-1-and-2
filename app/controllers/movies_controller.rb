class MoviesController < ApplicationController
  def new
    @movie = Movie.new

  end

  def index

    @movies = Movie.order(created_at: :desc )

    respond_to do |format|
      format.json do
        render json: @list_of_movies
      end

      format.html do
        render({ :template => "movies/index" })
      end
    end
  end

  def show
    #the_id = params.fetch(:id)

    #matching_movies = Movie.where( id: the_id ) (..find_by and find knows to search within the id col.)

    #@the_movie = matching_movies.first (find eliminates the need for .first automatically pulls the first record)

    @movie = Movie.find(params.fetch(:id))

  end

  def create
    @movie = Movie.new
    movie_attributes = params.require(:movie).permit(:title, :description)
    @movie = Movie.new(movie_attributes)
    #@movie.title = params.fetch(:movie).fetch(:title)
    #@movie.description = params.fetch(:movie).fetch(:description)

    if @movie.valid?
      @movie.save
      redirect_to movies_url, notice: "Movie created successfully." 
    else
     
    end
  end

  def edit
    the_id = params.fetch(:id)

    matching_movies = Movie.where( id: the_id )

    @the_movie = matching_movies.first

    
  end

  def update
    the_id = params.fetch(:id)
    the_movie = Movie.where(id: the_id ).first

    the_movie.title = params.fetch("query_title")
    the_movie.description = params.fetch("query_description")

    if the_movie.valid?
      the_movie.save
      redirect_to movie_url(the_movie),  notice: "Movie updated successfully."
    else
      redirect_to movie_url(the_movie), alert:  "Movie failed to update successfully." 
    end
  end

  def destroy
    the_id = params.fetch(:id)
    the_movie = Movie.where( id: the_id ).first

    the_movie.destroy

    redirect_to(movies_path, { :notice => "Movie deleted successfully."} )
  end
end
