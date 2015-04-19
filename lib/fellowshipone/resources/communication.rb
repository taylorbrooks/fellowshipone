module Fellowshipone
  class Client
    module Communication

      def new_communication(person_id)
        get("/v1/People/#{person_id}/Communications/new.json")
      end

      def create_communication(person_id, json_body)
        post("/v1/People/#{person_id}/Communications.json", json_body)
      end

    end
  end
end
