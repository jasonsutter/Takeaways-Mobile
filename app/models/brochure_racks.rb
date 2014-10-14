class BrochureRack
  attr_accessor :name, :id

  def initialize(attrs)
    attrs.each_pair do |key, value|
      self.send("#{key}=", value)
    end
  end

  def self.from_json(json)
    new(:name => json["name"], :id => json["id"])
  end
end
