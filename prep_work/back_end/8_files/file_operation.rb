require 'nokogiri'
require 'json'
require 'csv'
require 'axlsx'


s_articles = []
# doc = Nokogiri::XML(File.open("files/slashdot.xml","r"))

File.open("slashdot.xml","r") do |ln|
  doc = Nokogiri::XML(ln)
  s_articles = doc.css('item').map do |i|
    {
      title: i.at_css('title').content,
      link: i.at_css('link').content,
      description: i.at_css('description').content
    }
  end

end


f_articles = []

File.open("feedzilla.json","r") do |f|
  items = JSON.parse(f.read)

   f_articles = items['articles'].map do |a|
    {
      title: a['title'],
      link: a['link'],
      summary: a['summary']
    }
  end
end

sorted_articles = (s_articles + f_articles ).sort_by { |a| a[:title] }

CSV.open("articles.csv","wb") do |csv|
  sorted_articles.each { |a| csv <<  [ a[:title], a[:link], a[:summary] ] }
end

pkg = Axlsx::Package.new

pkg.workbook.add_worksheet(:name => "Articles" ) do |sheet|
  sorted_articles.each { |a| sheet.add_row [ a[:title], a[:link], a[:summary] ] }
end
pkg.serialize("articles.xlsx")






