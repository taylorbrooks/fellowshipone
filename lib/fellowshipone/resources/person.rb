require 'addressable/uri'

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

      def search_for_person(name: nil, email: nil)
        options = {}
        options.merge!(searchfor: name)      if name
        options.merge!(communication: email) if email

        params = Addressable::URI.form_encode(options)
        get("/v1/People/Search.json?#{params}").results
      end

      def search_people_by_date(created_at)
        get("/v1/People/Search.json?createdDate=#{created_at}").results
      end

      def search_for_person_by_household(household_id)
        get("/v1/People/Search.json?hsid=#{household_id}").results
      end

    end
  end
end
