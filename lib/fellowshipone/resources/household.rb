module Fellowshipone
  class Client
    module Household

      def new_household
        get("/v1/Households/new.json")
      end

      def create_household(household_params)
        post("/v1/Households.json", household_params)
      end

    end
  end
end
