module Fellowshipone
  class Client
    module Household

      def find_household(id)
        get("/v1/Households/#{id}.json")
      end

      def new_household
        get("/v1/Households/new.json")
      end

      def create_household(household_params)
        post("/v1/Households.json", household_params)
      end

    end
  end
end
