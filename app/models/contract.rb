class Contract < ApplicationRecord
    validates :title, presence: true, length: {minimum: 3}
    validates :owner, presence: true
    validates :kind, presence: true
    enum :status, {expired: 0, drafted: 1, approved: 2}
end
