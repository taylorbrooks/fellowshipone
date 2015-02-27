module FellowshipOne
  class Client
    module Fund

      def funds
        get('/giving/v1/funds')
      end

      def fund(id)
        get("/giving/v1/fund/#{id}.json")
      end

    end
  end
end
