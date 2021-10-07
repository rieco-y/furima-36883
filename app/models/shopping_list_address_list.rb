class ShoppingListAddressList

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_num, :todouhuken_id, :city, :house_num, :building_nam, :tel_num, :shopping_list_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :shopping_list_id
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_num
    validates :tel_num, format: {with: /\A\d{10,11}\z/, message: "is invalid"}
  end
  validates :todouhuken_id, numericality: {other_than: 0, message: 'Please select one'}

  def save
    shopping_list = ShoppingList.create(user_id: user_id, item_id: item_id)
    AddressList.create(post_num: post_num, todouhuken_id: todouhuken_id, city: city, house_num: house_num, building_nam: building_nam, tel_num: tel_num, shopping_list_id: shopping_list.id)
  end

end