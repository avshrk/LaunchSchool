require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"
# require 'byebug'

before do
	@contents = File.readlines('data/toc.txt')
end

def each_chapter(&block)
	@contents.each_with_index do |chapter_title, idx|
		chapter_number = idx + 1
		content = File.read("data/chp#{chapter_number}.txt")
		yield chapter_number, chapter_title, content
	end
end

def chapters_matching(query)
	result = []
	return result unless query

	each_chapter do |chp_num, chp_title, content |
		matches = {}
		content.split("\n\n").each_with_index do |paragraph, index|
			matches[index] = paragraph if paragraph.include? query
		end
		result << {number: chp_num, title: chp_title, paragraphs: matches} if matches.any?
	end
	result
end

helpers do
	def highlight(text, term)
		text.gsub(term, %(<strong>#{term}</strong>))
	end
	def slugify(text)
		text.downcase.gsub(/\s+/,'-').gsub(/[^\w-]/,'')
	end

	def in_paragraphs(text)
		text.split("\n\n").each_with_index.map do |line, index|
			"<p id=paragraph#{index}>#{line}</p>"
		end.join
	end
end

get "/" do
	@title = "My Page"
	erb :Home
end

get "/chapter/:number" do
	number = params[:number].to_i
	@toc = File.readlines('data/toc.txt')
	@title = "Chapter #{number}: #{@toc[number-1]}"
	@chapter = in_paragraphs(File.read("data/chp#{number}.txt"))
	# byebug
	erb :Chapter
end

get "/search" do
	@results = chapters_matching(params[:query])
	erb :search
end

not_found do
	redirect '/'
end
