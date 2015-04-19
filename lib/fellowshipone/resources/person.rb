module Fellowshipone
  class Client
    module Person

      def list_people(attrs={})
        get('/v1/People/Search.json', attrs)
      end

      def find_person(id)
        get("/v1/People/#{id}")
      end

      def new_person
        get("/v1/People/new.json")
      end

      def create_person(person_params)
        post("/v1/People.json", person_params.to_json)
      end

      def search_for_person(name, email)
        get("/v1/People/Search.json?searchfor=#{name}&communication=#{email}").results
      end

    end
  end
end
