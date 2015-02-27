token = ""
secret = ""
church_code = ""

@client ||= FellowshipOne::Client.new(token, secret, church_code)

find_or_create_fellowship_person
contribution = build_fellowship_contribution

@donation.refs = {"f1_id" => contribution.id}
raise
@donation.save

def find_or_create_fellowship_person
  people = @client.search_for_person({name: "taylor", email: "tbrooks@gmail"})

  if people.count == 0
    @donor = build_fellowship_person
    build_fellowship_email
  else
    @donor = people.first
  end
end

def build_fellowship_person
  household                          = @client.new_household
  household.household_name           = "Taylor Brooks"
  @client.save_household(household)

  donor                              = @client.new_person
  donor.household_id                 = household.id.to_s
  donor.id                           = ''
  donor.household_member_type['@id'] = '1'
  donor.status['@id']                = '6'     # Contributor Only
  donor.first_name                   = "Taylor"
  donor.last_name                    = "Brooks"
  @client.create_person(donor)
end

def build_fellowship_email
  communication                            = @client.new_communication(@donor.id)
  communication.communication_type['@id']  = '4'
  communication.communication_type['name'] = 'Email'
  communication.communication_general_type = 'Email'
  communication.preferred                  = 'true'
  communication.communication_value        = @customer.email
  communication.search_communication_value = @customer.email
  @client.create_communicate(@donor.id, communication.id, communication)
end

def build_fellowship_contribution
  contribution                          = @client.new_contribution
  contribution.amount                   = @donation.gross_amount/100.00

  contribution.fund['@id']              = @donation.fund.settings['fellowship_fund_id']

  contribution.household['@id']         = @donor.household_id
  contribution.received_date            = @donation.created_at.iso8601 # Needs to be this format
  contribution.contribution_type['@id'] = @donation.payment_type == 'bank account' ? 5 : 3 # 3 - Credit Card, 5 - ACH

  contribution.memo                   = "Simple Donation - #{@donation.id}"

  contribution.address_verification     = false
  @client.create_contribution(contribution)
end
