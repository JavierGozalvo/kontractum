class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :contracts, dependent: :destroy

    validates :name, presence: true
    validates :surname, presence: true
    validates :doc_id, presence: true, format: {with: /[\d]{8}[A-Z]{1}/ , message: "Please enter your id in the correct format"}
    validates :doc_kind, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :birthdate, presence: true, format: {with: /[\d]{1,2}(\-|\/)[\d]{1,2}(\-|\/)[\d]{4}/}
    validates :address, presence: true
    validates :city, presence: true, format: {with: /[A-Z]\D+/}
    validates :postalcode, presence: true, format: {with: /\b\d{5}\b/, message: "Please enter a valid postal code"}
    
    validate  :is_adult?

    enum :doc_kind, {dni: 0, driver_license: 1, passport: 2}

    
    def is_adult?
        my_bday = Date.parse(birthdate) rescue nil
        return false if my_bday.blank?
         
        if !(((Date.today - 18.year) >= my_bday) && (Date.today - 100.year) <= my_bday)
          errors.add(:birthdate, "User is not adult")
        end 
        
    end


end
