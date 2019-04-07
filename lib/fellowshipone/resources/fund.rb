module Fellowshipone
  class Client
    module Fund

      def funds
        response = get('/giving/v1/funds')
        Fellowshipone::Fund.format(response)
      end

      def fund(id)
        get("/giving/v1/fund/#{id}.json")
      end

      def subfunds(fund_id)
        response = get("/giving/v1/funds/#{fund_id}/subfunds")
        Fellowshipone::SubFund.format(response)
      end

    end
  end
end
