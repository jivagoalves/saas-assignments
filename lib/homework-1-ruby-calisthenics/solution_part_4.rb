class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories)
    self.name = name
    self.calories = calories
  end

  def delicious?
    true
  end

  def healthy?
    return true if self.calories < 200
    false
  end
end

class JellyBean < Dessert
  attr_accessor :flavor

  def initialize(name, calories, flavor)
    super(name,calories)
    self.flavor = flavor
  end

  def delicious?
    return false if self.flavor == "black licorice"
    true
  end
end
