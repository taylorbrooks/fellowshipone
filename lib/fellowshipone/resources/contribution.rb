module Fellowshipone
  class Client
    module Contribution

      def contributions

      end

      def get_contribution(id)
        get("/giving/v1/contributionreceipts/#{id}.json")
      end

      def new_contribution
        get("/giving/v1/contributionreceipts/new.json")
      end

      def create_contribution(contribution_params)
        post("/giving/v1/contributionreceipts.json", contribution_params)
      end

    end
  end
end
