require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require 'byebug'

before do
  @toc = File.readlines "data/toc.txt"
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  erb :home
end

get "/chapters/:chapter" do
  @title = "Chapter #{params[:chapter]}: #{@toc[params[:chapter].to_i - 1]}"
  @chapter = File.read("data/chp#{params[:chapter]}.txt")
  erb :chapter
end

not_found do
  redirect  "/"
end

get "/search" do
  @results = chapters_matching(params[:query])
  erb :search
end


def each_chapter(&block)
  @toc.each_with_index do |name, index|
    contents = File.read("data/chp#{index + 1}.txt")
    yield index + 1, name, contents
  end
end

def chapters_matching(query)
  result = []

  return result unless query

  each_chapter do |number, name, contents|
    result << {number: number, name: name} if contents.include? query
  end

  result
end

helpers do
  def in_paragraphs(text)
    text.split("\n\n").map { |each_line| "<p>" + each_line + "</p>" }.join
  end
end
