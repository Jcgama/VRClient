require File.expand_path '../../lib/VRClient.rb',__FILE__
require File.expand_path '../spec_helper.rb',__FILE__

describe VRClient do
  before do
    @client = VRClient.new
  end

  describe "#get_city" do
    context "given that city is São Paulo" do
      it "returns the right value" do
          expect(@client.get_city("São Paulo")).to eq "&locIds=BR%3ESao+Paulo%3ENULL%3ESao+Paulo&locationIds=BR%3ESao+Paulo%3ENULL%3ESao+Paulo"
      end
    end
    context "given that city is Rio de Janeiro" do
      it "returns the right value" do
          expect(@client.get_city("Rio de Janeiro")).to eq "&locIds=BR%3ERio+de+Janeiro%3ENULL%3ERio+de+Janeiro&locationIds=BR%3ERio+de+Janeiro%3ENULL%3ERio+de+Janeiro"
      end
    end
    context "given that city is neither Rio or São Paulo" do
      it "returns Rio de Janeiro" do
        expect(@client.get_city("Paraty")).to eq "&locIds=BR%3ERio+de+Janeiro%3ENULL%3ERio+de+Janeiro&locationIds=BR%3ERio+de+Janeiro%3ENULL%3ERio+de+Janeiro"
      end
    end
  end

  describe "#build_url" do
    context "given that city is São Paulo" do
      it "returns the right value" do
        expect(@client.build_url("São Paulo")).to eq "?apiKey=183d98b9-fc81-4ef1-b841-7432c610b36e&portal=VR_BR&page=1&maxResults=3&language=pt&rankingId=0&currency=BRL&business=VENTA&listingType=APART&listingUse=RESIDENCIAL&locIds=BR%3ESao+Paulo%3ENULL%3ESao+Paulo&locationIds=BR%3ESao+Paulo%3ENULL%3ESao+Paulo"
      end
    end
  end

  describe "#get" do
    context "given that city is São Paulo" do

      before do
        @response = @client.get "São Paulo"
      end

      it "response to contain 3 listings" do
        expect(@response['listings'].size).to eq 3
      end

      it "listing to be from São Paulo" do
        expect(@response['listings'][0]["cityName"]).to eq "São Paulo"
      end
    end
  end
end
