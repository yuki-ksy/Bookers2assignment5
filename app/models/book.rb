class Book < ApplicationRecord

  belongs_to :user

  validates :title, presence: true, length: { maximum: 200 }
  validates :body, presence: true, length: { maximum: 200 }


  def self.search(search, word)
    if search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "perfect_match"
      @book = Book.where("title","#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end
end
