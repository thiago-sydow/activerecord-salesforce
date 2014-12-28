require_relative '../lib/active_record/salesforce'

class Person
  include ActiveRecord::Salesforce::Base

  attr_accessor :name, :last_name, :company, :email, :job_title, :phone,
                :website, :owner_id, :converted, :unread_by_owner

  salesforce_object :Lead

  #SalesForce_attribute, RDStation_attribute
  map_attribute :FirstName      , :name
  map_attribute :LastName       , :last_name
  map_attribute :Company        , :company
  map_attribute :Email          , :email
  map_attribute :JobTitle__c    , :job_title
  map_attribute :Phone          , :phone
  map_attribute :Website        , :website
  map_attribute :OwnerId        , :owner_id
  map_attribute :IsConverted    , :converted
  map_attribute :IsUnreadByOwner, :unread_by_owner

  def initialize
    @converted = false
    @unread_by_owner = false
  end

end