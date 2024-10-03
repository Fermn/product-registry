class Product < ApplicationRecord
    validates :title, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and spaces" }
end
