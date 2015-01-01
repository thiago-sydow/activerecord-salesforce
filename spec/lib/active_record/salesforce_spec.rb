require 'spec_helper'
require 'byebug'

describe ActiveRecord::Salesforce::Base do

  before do
    @person = Person.new
  end

  context 'map attributes' do
    it { expect(@person.class.maped.size).to eq(10) }
    it { expect(@person.class.maped[:FirstName]).to eq(:name) }
  end

  context 'salesforce object' do
    it { expect(@person.class.sobject).to eq(:Lead) }
  end

  context 'multiple objects' do

    before do
      @person2 = Person.new
      @person.company = "Empresa 1"
      @person2.company = "Empresa 2"
    end

    it { expect(@person.company).to eq("Empresa 1") }
    it { expect(@person2.company).to eq("Empresa 2") }

    context 'different models' do
      before do
        @contact = Contact.new
      end

      it { expect(@person.class.sobject).to eq (:Lead) }
      it { expect(@contact.class.sobject).to eq (:Contact) }
      it { expect(@person.class.maped.size).to eq(10) }
      it { expect(@contact.class.maped.size).to eq(2) }
    end

  end


  context 'save in salesforce' do
    before do
      @person = Person.new
      @person.company = "Empresa 1"
      @person.email = "thiagovs05@gmail.com"
      @person.job_title = "Analista de Sistemas"
      @person.name = "Thiago"
      @person.last_name = "von Sydow"
      @config = YAML.load_file(File.expand_path("../../../../examples/config/salesforce.yml", __FILE__))
    end

    it { expect(@person.save_in_salesforce(@config['resultados_digitais'])).to be }


    it 'checks for config' do
      expect {@person.save_in_salesforce}.to raise_error(ActiveRecord::Salesforce::Base::ConfigFileMissing)
    end

    it 'raises error when can\'t login'  do
      expect {@person.save_in_salesforce(@config['other_company'])}.to raise_error(ActiveRecord::Salesforce::Base::UserNotAuthenticable)
    end


    context 'check for attributes if variable is nil' do
      before do
        @person.company = nil
      end

      it { expect(@person.save_in_salesforce(@config['resultados_digitais'])).to be }

      it 'not saves when id mandatory and don\'t have the attribute'  do
        @person.last_name = nil
        expect(@person.save_in_salesforce(@config['resultados_digitais'])).to be(false)
      end
    end

  end

end