# == Schema Information
#
# Table name: products
#
#  id             :bigint(8)        not null, primary key
#  name           :string
#  description    :text
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#

class Product < ApplicationRecord

end
