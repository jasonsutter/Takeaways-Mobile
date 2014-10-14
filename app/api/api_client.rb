class ApiClient
  def self.fetch_brochure_racks(&block)
    BubbleWrap::HTTP.get("http://0.0.0.0:3000/api/v1/brochure_racks") do |response|
      if response.ok?
        json = BubbleWrap::JSON.parse(response.body)
        brochure_racks = json["brochure_racks"].map {|brj| BrochureRack.from_json(brj)}
        block.call(true, brochure_racks)
      else
        block.call(false, nil)
      end
    end
  end
end
