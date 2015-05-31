module Fellowshipone
  class Client
    module Contribution

      def contributions

      end

      def get_contribution(contribution_id)
        get("/giving/v1/contributionreceipts/#{contribution_id}.json")
      end

      def new_contribution
        get("/giving/v1/contributionreceipts/new.json")
      end

      def create_contribution(contribution_params)
        post("/giving/v1/contributionreceipts.json", contribution_params)
      end

      def update_contribution(contribution_id, contribution_params)
        put("/giving/v1/contributionreceipts/#{contribution_id}.json", contribution_params)
      end

    end
  end
end
