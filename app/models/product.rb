class Product < ApplicationRecord
    has_one_attached :main_image
    before_save :capatilize_attribute
    belongs_to :user
    has_many :orders
    validates :title, :price, presence: true
    protected
    def capatilize_attribute
        self.title = title.capitalize
    end
end