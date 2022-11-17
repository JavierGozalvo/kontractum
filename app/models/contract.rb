class Contract < ApplicationRecord
    mount_uploader :contract_file, FileUploader
    belongs_to :owner, class_name: "User", foreign_key: "owner", required: true
    belongs_to :beneficiary, class_name: "User", foreign_key: "beneficiary", required: true

    scope :by_status, -> (status){where(status: status)}
    scope :by_beneficiary, -> (beneficiary){where(beneficiary: beneficiary)}
    scope :by_owner, -> (owner){where(owner: owner)}

    def self.ransackable_scopes(auth_object = nil)
        [:by_status]
    end

    validates :title, presence: true, length: {minimum: 3}
    validates :kind, presence: true
    validates :payable, inclusion: [true, false]

    enum :status, { expired: 0, 
                    archived: 1, 
                    approved: 2, 
                    proposed: 3, 
                    modification_requested: 4,
                    modification_in_progress: 5,
                    edited: 6,
                    tokenization_requested: 7,
                    tokenizable: 8,
                    tokenized: 9}, default: :proposed
end
