class Product < ActiveRecord::Base
  def sale_message
      if price && price < 2
          return "Discount Item!"
      else
          return "Everyday Value!"
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
