module Fellowshipone
  class Contribution

    def self.format(res)
      response = res["contributionReceipt"]
      if response.is_a?(Array)
        response.map{|contribution| format_contribution(contribution) }
      else
        format_contribution(response)
      end
    end

    def self.format_contribution(contribution)
      OpenStruct.new(
        id:       contribution["@id"],
        amount:   contribution["amount"],
        fund:     contribution["fund"]["name"],
        sub_fund: contribution["subFund"]["name"],
        date:     contribution["receivedDate"]
      )
    end
  end
end
