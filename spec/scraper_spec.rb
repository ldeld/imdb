require_relative '../scraper'

describe '#top_links' do
    it "returns an array of the first five movie links" do
        expected = [
            "https://www.imdb.com/title/tt0111161/",
            "https://www.imdb.com/title/tt0068646/",
            "https://www.imdb.com/title/tt0071562/",
            "https://www.imdb.com/title/tt0468569/",
            "https://www.imdb.com/title/tt0050083/"
          ]
        
        actual = top_links

        expect(actual).to eq(expected)  
    end    
end

describe "#scrape_movie" do
    it "return hash with data from IMDB movie" do
        url = "https://www.imdb.com/title/tt0468569/"
        expected = {
            cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
            storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
            director: "Christopher Nolan",
            title: "The Dark Knight",
            year: 2008
        }

        actual = scrape_movie(url)

        expect(actual).to eq(expected)
    end
end
