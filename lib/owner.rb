class Owner
  
  attr_accessor :pets
  
  attr_reader :species, :name
  
  @@owner_instances=[]
  
  
  
  def initialize(name, species="human")
    @name= name 
    @species=species
    @pets= { :cats=> [], :dogs => [] }
    @@owner_instances << self
    
    
  end 
  
  def say_species
    return "I am a #{@species}."
  end 
  
  def self.all 
    @@owner_instances
  end 
  
  def self.count
    @@owner_instances.size 
  end 
  
  def self.reset_all
    @@owner_instances.clear 
  end 
    
  def cats 
    Cat.all.select{|cat| cat.owner==self}
      
  end 
  
  def dogs
    Dog.all.select{|dog| dog.owner==self}
  end 
  
  def buy_cat(cat)
    @pets[:cats] << Cat.new(cat,self)
  end 
    
  
  def buy_dog(dog)
    
    @pets[:dogs] << Dog.new(dog,self)
  end 
  
  def walk_dogs
    
    @pets.collect do |species, instances|
      if species == :dogs
        instances.map do |dog|
          dog.mood = "happy"
        end
      end
    end
  end 
  
  def feed_cats 
   @pets.collect do |species, instances|
      if species == :cats
        instances.map do |cat|
          dog.mood = "happy"
        end
      end
    end
    
    
  end 
  
  def sell_pets
    
    @pets.collect do |species, instances|
      instances.each do |pet|
        pet.mood = "nervous"
      end
      instances.clear
    end
      
    
  end 
  
  def list_pets
    "I have #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end 
    
  
  
  
end