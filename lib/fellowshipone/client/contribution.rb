module FellowshipOne
  class Client
    module Contribution

      def contributions

      end

      def contribution(id)
        get("/giving/v1/contributionreceipts/#{id}.json")
      end

      def new_contribution
        get("/giving/v1/contributionreceipts/new.json")
      end

      def create_contribution(json_body)
        post("/giving/v1/contributionreceipts.json", json_body)
      end

    end
  end
end
