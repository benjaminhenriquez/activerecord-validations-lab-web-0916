class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: ["Fiction", "Non-Fiction"]
  validate :clickbaity?




    def clickbaity?
      top_num = (1..9).map {|i| "Top #{i}"}
      array = ["Won't Believe", "Secret", "Guess", "True"] + top_num

      if self.title
        bait_bool = array.any? do |phrase|
          self.title.include?(phrase)
        end
        if bait_bool
          return true
        else
          return false
        end
      else
        false
      end
    end


end
