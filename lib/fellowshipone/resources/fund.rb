module Fellowshipone
  class Client
    module Fund

      def funds
        get('/giving/v1/funds')
      end

      def fund(id)
        get("/giving/v1/fund/#{id}.json")
      end

      def subfunds(fund_id)
        get("/giving/v1/funds/#{fund_id}/subfunds")
      end

    end
  end
end
