module Fellowshipone
  class SubFund
    def self.format(res)
      return nil if res['subFunds'].nil?

      response = res['subFunds']['subFund']

      if response.is_a?(Array)
        response.map{|fund| format_fund(fund) }
      else
        format_fund(response)
      end
    end

    def self.format_fund(fund)
      OpenStruct.new(
        id:   fund['@id'],
        name: fund['name'],
      )
    end
  end
end
