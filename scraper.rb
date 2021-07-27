require 'open-uri'
require 'nokogiri'
require 'pry'

def top_links
    url = "https://www.imdb.com/chart/top"
    html = URI.open(url).read
    html_doc = Nokogiri::HTML(html)

    html_doc.search('.titleColumn a').first(5).map do |element|
        "https://www.imdb.com#{element.attribute('href').value}"
    end
end


# scrape_movie(ur)
# open the url
# parse string into html element
# extract data with css selectors
# return a hash with movie data 
def scrape_movie(url)
    html = URI.open(url, "Accept-Language" => "en-US").read
    html_doc = Nokogiri::HTML(html)

    title = html_doc.search('[data-testid="hero-title-block__title"]').first.text.strip
    year = html_doc.search('.ipc-inline-list__item span').first.text.strip.to_i
    storyline = html_doc.search('[data-testid="plot"] span').first.text.strip
    director = html_doc.search('.ipc-metadata-list__item').first.search('a').first.text.strip
    cast_links = html_doc.search('[data-testid="title-pc-principal-credit"]').last.search('li a')
    cast = cast_links.map { |cast_member| cast_member.text.strip } 
    { 
        title: title,
        year: year,
        director: director,
        storyline: storyline,
        cast: cast
    }
end
