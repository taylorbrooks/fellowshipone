module Fellowshipone
  class Client
    module PledgeDrive

      def list_pledge_drives(fund_id)
        get("/giving/v1/funds/#{fund_id}/pledgedrives")
      end

    end
  end
end
