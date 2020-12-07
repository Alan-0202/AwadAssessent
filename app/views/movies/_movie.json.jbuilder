json.extract! movie, :id, :homepage, :overview, :release, :revenue, :title, :created_at, :updated_at
json.url movie_url(movie, format: :json)
