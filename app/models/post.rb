class Post < ApplicationRecord
    validate :clickbait?
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    
    CLICKBAIT_PHRASES = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]

    def clickbait?
        if CLICKBAIT_PHRASES.none? { |t| t.match title }
            errors.add(:title, "must be clickbait")
        end
    end
end
