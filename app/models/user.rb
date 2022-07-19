class User < ApplicationRecord
    has_many: :contracts, dependent: :destroy

    validates :name, presence: true
    validates :surname, presence: true
    validates :doc_id, presence: true
    validates :doc_kind, presence: true
    validates :email, presence: true
    validates :birthdate, presence: true

    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

    enum :doc_kind, {dni: 0, driver_license: 1, passport: 2}
end
