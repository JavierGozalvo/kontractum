class Contract < ApplicationRecord
    mount_uploader :contract_file, FileUploader
    belongs_to :owner, class_name: "User", foreign_key: "owner", required: true
    belongs_to :beneficiary, class_name: "User", foreign_key: "beneficiary", required: true

    scope :by_title, -> (title){where(title: title)}
    scope :by_payable, -> (payable){where(payable: payable)}
    scope :by_owner, -> (owner_id){where(owner: owner_id)}
    scope :by_beneficiary, -> (beneficiary_id){where(beneficiary: beneficiary_id)}
    scope :by_status, -> (status){where(status: status)}

    validates :title, presence: true, length: {minimum: 3}
    validates :kind, presence: true
    validates :payable, inclusion: [true, false]

    enum :status, { expired: 0, 
                    archived: 1, 
                    approved: 2, 
                    proposed: 3, 
                    modification_requested: 4,
                    modification_in_progress: 5,
                    edited: 6}, default: :proposed
end
