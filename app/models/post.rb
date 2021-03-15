class Post < ActiveRecord::Base
    validates :title, presence: true
    validates(:content, { :length => { :minimum => 250 } })
    validates(:summary, { :length => { :maximum => 250 } })
    validates(:category, inclusion: ["Fiction", "Non-Fiction"])
    validate :clickbait

    def clickbait
        if (title =~ /Won't Believe|Secret|Guess|Top [0-9]+/) == nil
            errors.add(:title, "Not clickbait-y enough")
        end
    end
end
