class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products
  #has_many :orders, through: :carted_products



  def sale_message
    if price && price < 2
      'Discount Item!'
    else
      'Everyday Value!'
    end
  end

  def tax
    return 0 unless price
    price * 0.09
  end

  def total
    return 0 unless price
    price + tax
  end
end
