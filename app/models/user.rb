class User < ApplicationRecord
    has_many :contracts, dependent: :destroy

    validates :name, presence: true
    validates :surname, presence: true
    validates :doc_id, presence: true
    validates :doc_kind, presence: true
    validates :email, presence: true
    validates :birthdate, presence: true
    validate :is_adult?

    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :doc_id, format: {with: /[\d]{8}[A-Z]{1}/ , message: "Please enter your id in the correct format"}
    #validates :birthdate, format: {with: /[\d]{1,2}-[\d]{1,2}-[\d]{4}/, message: "Please enter your birthdate in the correct format"}
    enum :doc_kind, {dni: 0, driver_license: 1, passport: 2}

    
    def is_adult?
        return false if birthdate.blank? 

        my_bday = Date.parse(birthdate)
        (Date.today - 18.year) > my_bday && (Date.today - 100.year) < my_bday
    end


end
