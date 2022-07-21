class Contract < ApplicationRecord
    belongs_to :user, required: true

    validates :title, presence: true, length: {minimum: 3}
    validates :user_id, presence: true
    validates :kind, presence: true
    enum :status, {expired: 0, drafted: 1, approved: 2}
end
