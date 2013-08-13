#encoding: utf-8
module ApplicationHelper
  def account_for_customer
    "기업은행 261-063451-04-011 (주)몽클"
  end
  
  def default_price
    price = 3400
    sale = 0.1
    sale_price = (price - (price * sale)).to_i
    return "오픈기념 10%할인 가격인 #{sale_price}원"
  end
  
end
