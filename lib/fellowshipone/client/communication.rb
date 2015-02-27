module Fellowshipone
  class Client
    module Communication

      def new_communication(person_id)
        post("/v1/People/#{person_id}/Communications")
      end

      def create_communication(person_id, communication_id, json_body)
        put("/v1/People/#{person_id}/Communications/#{communication_id}", json_body)
      end

    end
  end
end
