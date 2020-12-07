namespace :customer do
  desc "This take does something useful!"
  task :do_movies => [ :environment ] do
    puts "Do something useful!"

    require 'csv'
    filename = File.expand_path("../", __FILE__ ) + "/movies.csv"
    CSV.foreach(filename, :headers => true) do |row|

      # name author reviews price4 year5
      #for fiction
      # Fiction.create!(name: row[0], author: row[1], reviews: row[3], price: row[4], year: row[5])
      # for country
      # Country.create!(name: row[0], la: row[1], lo: row[2])
      # for movies  homepage:string overview:string release:string revenue:decimal title:string
      Movie.create!(homepage: row[0], overview: row[1], release: row[2], revenue: row[3], title: row[4])

    end
  end

  task :do_countries => [ :environment ] do
    puts "Do something useful!"

    require 'csv'
    filename = File.expand_path("../", __FILE__ ) + "/country.csv"
    CSV.foreach(filename, :headers => true) do |row|

      # name author reviews price4 year5
      #for fiction
      # Fiction.create!(name: row[0], author: row[1], reviews: row[3], price: row[4], year: row[5])
      # for country
      Country.create!(name: row[0], la: row[1], lo: row[2])
      # for movies  homepage:string overview:string release:string revenue:decimal title:string
      # Movie.create!(homepage: row[0], overview: row[1], release: row[2], revenue: row[3], title: row[4])

    end
  end

  task :do_fictions => [ :environment ] do
    puts "Do something useful!"

    require 'csv'
    filename = File.expand_path("../", __FILE__ ) + "/book.csv"
    CSV.foreach(filename, :headers => true) do |row|

      # name author reviews price4 year5
      #for fiction
      Fiction.create!(name: row[0], author: row[1], reviews: row[3], price: row[4], year: row[5])
      # for country
      # Country.create!(name: row[0], la: row[1], lo: row[2])
      # for movies  homepage:string overview:string release:string revenue:decimal title:string
      # Movie.create!(homepage: row[0], overview: row[1], release: row[2], revenue: row[3], title: row[4])

    end
  end
end
