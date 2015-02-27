module FellowshipOne
  class Client
    module Person

      def people(attrs={})
        get('/v1/People/Search.json', attrs)
      end

      def person(id)
        get("/v1/People/#{id}")
      end

      def new_person
        get("/v1/People")
      end

      def create_person(person_attrs)
        post("/v1/People", person_attrs.to_json)
      end

    end
  end
end
