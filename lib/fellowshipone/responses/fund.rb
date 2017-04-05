module Fellowshipone
  class Fund

    def self.format(res)
      response = res["funds"]["fund"]
      if response.is_a?(Array)
        response.map{|fund| format_fund(fund) }
      else
        format_fund(response)
      end
    end

    def self.format_fund(fund)
      OpenStruct.new(
        id:   fund["@id"],
        name: fund["name"],
      )
    end
  end
end
