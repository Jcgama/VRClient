require "httparty"

class VRClient
  include HTTParty

  base_uri "https://api.vivareal.com/api/1.0/locations/listings"

  def get(cidade="São Paulo", business="VENTA", listing_type="APART", listing_use="RESIDENCIAL")
    self.class.get build_url(cidade)
  end

  def get_city(cidade)
    return "&locIds=BR%3ESao+Paulo%3ENULL%3ESao+Paulo&locationIds=BR%3ESao+Paulo%3ENULL%3ESao+Paulo" if "São Paulo".eql? cidade

    "&locIds=BR%3ERio+de+Janeiro%3ENULL%3ERio+de+Janeiro&locationIds=BR%3ERio+de+Janeiro%3ENULL%3ERio+de+Janeiro"
  end

  def build_url(cidade)
    "#{base_auth}&business=VENTA&listingType=APART&listingUse=RESIDENCIAL#{get_city(cidade)}"
  end

  private
    def base_auth
      "?apiKey=183d98b9-fc81-4ef1-b841-7432c610b36e&portal=VR_BR&page=1&maxResults=3&language=pt&rankingId=0&currency=BRL"
    end
end
