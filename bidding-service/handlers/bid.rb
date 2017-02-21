require 'json'
require_relative 'interface'

module Bid
  class << self
    include Interface

    def post(data)
      bid = OpenStruct.new(data)
      campaign = campaign_with_highest_cpm(bid)
      OpenStruct.new({"body" => campaign.to_json, "status" => 200})
    end

    private

    def eligible_campaigns(bid)
      all = get_all_campaigns
      all.select { |campaign|
        campaign.target.values.first == bid.placement
      }.select {|campaign| campaign.budget > 0}
    end

    def campaign_with_highest_cpm(bid)
      eligible_campaigns(bid)
    end

    def get_all_campaigns
      raw_data = [
        {
          "campaign_id": 100101,
          "cpm": 0.32,
          "budget": 35.50,
          "target": {"placement": "Words With Friends 2 iPad"}
        },
        {
          "campaign_id": 100105,
          "cpm": 0.02,
          "budget": 2.25,
          "target": {"country": "CAN"}
        }
      ]
      raw_data.map {|h| OpenStruct.new(h)}
    end
  end
end
