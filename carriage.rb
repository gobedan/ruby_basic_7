require_relative './company_info.rb'

class Carriage 
  include CompanyInfo
  
  protected

  @@id_counter = 0 
  
  def self.id_counter
    @@id_counter 
  end

  def self.id_counter=(new_id)
    @@id_counter = new_id
  end
end
