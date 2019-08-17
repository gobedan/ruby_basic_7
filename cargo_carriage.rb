require_relative './carriage.rb'

class CargoCarriage < Carriage
  attr_reader :free_volume, :taken_volume
  attr_accessor :id
  
  def initialize(volume)
    @free_volume = volume
    validate!
    @taken_volume = 0
    #Не использую готовый миксин так как хочу чтобы счетчик сущностей был общим для разных потомков
    @@id_counter += 1
    @id = @@id_counter
  end

  def take_volume(size)   
    raise "Wrong cargo volume!" if size < 0 
    if (free_volume >= size) 
      self.free_volume -= size 
      self.taken_volume += size
    else 
      raise "No free space available!"
    end 
  end 

  def type 
    :cargo_carriage 
  end

  protected 

  attr_writer :free_volume, :taken_volume 

  def validate!
    validate_volume!
  end

  def validate_volume!
    raise "Wrong volume count!" unless free_volume >= 0 
  end
end
