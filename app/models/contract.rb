class Contract < ApplicationRecord
    belongs_to :owner, class_name: "User", foreign_key: "owner", required: true
    belongs_to :beneficiary, class_name: "User", foreign_key: "beneficiary", required: true
    

    validates :title, presence: true, length: {minimum: 3}
    validates :kind, presence: true
    validates :payable, inclusion: [true, false]

    enum :status, { expired: 0, 
                    drafted: 1, 
                    approved: 2, 
                    proposed: 3, 
                    modification_requested: 4,
                    payment_in_progress: 5,
                    paid: 6}
end
