class Item < ApplicationRecord
  belongs_to :list
  validates :description, presence: true

  def complete?
    self.status == 1
  end

  def incomplete?
    self.status == 0
  end
end
