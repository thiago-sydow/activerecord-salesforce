require_relative '../lib/active_record/salesforce'

class Contact
  include ActiveRecord::Salesforce::Base

  attr_accessor :name, :last_name

  salesforce_object :Contact

  #SalesForce_attribute, RDStation_attribute
  map_attribute :FirstName      , :name
  map_attribute :LastName       , :last_name

end