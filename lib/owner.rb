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
    
    self.dogs.each do |dog|
      dog.mood="happy"
    end 
    
  end 
  
  def feed_cats 
    self.cats.each do |cat|
      cat.mood="happy"
    end 
    
    
  end 
  
  def sell_pets

    all_pets = self.cats + self.dogs
    all_pets.each do |pet|
      pet.owner = nil
      pet.mood = "nervous"
    end
 end 

  def list_pets
    "I have #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end 
    
  
  
  
end