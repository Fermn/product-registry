class Product < ApplicationRecord
    validates :title, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and spaces" }

    before_save :format_title

    private

    def format_title
      self.title = title.strip.downcase
    end
end
