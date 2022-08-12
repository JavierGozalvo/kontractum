class Contract < ApplicationRecord
    belongs_to :owner, class_name: "User", foreign_key: "owner", required: true
    belongs_to :beneficiary, class_name: "User", foreign_key: "beneficiary", required: true
    
    #scope :filtered_by_owner, -> {where(owner: current_user)}
    #scope :filtered_by_beneficiary, -> {where(beneficiary: current_user)}
    #scope :filter_ownership, -> {order(where())}
    scope :by_name, -> (title){where(title: title)}
    scope :by_payable, -> (payable){where(payable: payable)}
    scope :by_owner, -> (owner_id){where(owner: owner_id)}
    scope :by_beneficiary, -> (beneficiary_id){where(beneficiary: beneficiary_id)}

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
