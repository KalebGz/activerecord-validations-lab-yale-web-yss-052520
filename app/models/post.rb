class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :clickbait
    
    def clickbait
        if title && !((title.include? "Won't Believe") || (title.include? "Secret") || (title.include? "Guess") || (title.include? "Top"))
            errors.add(:title, "not clickbait-y enough")
        end
    end
end
