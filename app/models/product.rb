class Product < ApplicationRecord
  
  belongs_to :supplier, optional: true
  has_many :images
  has_many :categorized_products
  has_many :categories, through: :categorized_products

  has_many :carted_products

  def sale_message 
    if price.to_f <= 2
      
      return "Discount Item!"
    else
      return "Everyday Value!!"
    end
  end

  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax
  end

end

#Bonus: add styling to your discounted items so the price shows up in red