class Post < ActiveRecord::Base
  belongs_to :contact
  

# column :head, :string
# column :title, :string
# column :post, :string

  validates :head, presence: true
  validates :title, presence: true,
  presence: { with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i }
  validates :post, presence: true, length: { maximum: 500 }, length: { minimum: 5 }

end