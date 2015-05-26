module ZenQuote
  extend ActiveSupport::Concern

  def get_quote
    url = 'https://api.github.com/zen'
    response = HTTParty.get(url)
    if response.code == 403 || response.code == 401
      return_string = 'Unfortunately, Github has rate limited us'
    else
      return_string = response
    end
    return_string
  end
end
