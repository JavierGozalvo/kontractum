class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
    has_many :contracts, inverse_of: 'owner'
    has_many :contracts, inverse_of: 'beneficiary'


    validates :name, presence: true
    validates :surname, presence: true
    validates :doc_id, presence: true, format: {with: /[\d]{8}[A-Z]{1}/ , message: "is invalid, please enter your id in the correct format"}
    validates :doc_kind, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message:"is invalid, please enter a valid mail"}
    validates :birthdate, presence: true, format: {with: /[\d]{1,2}(\-|\/)[\d]{1,2}(\-|\/)[\d]{4}/, message: "is invalid, please enter a valid date"}
    validates :address, presence: true
    validates :city, presence: true, format: {with: /[A-Z]\D+/, message: "is invalid, please use Uppercase in first letter"}
    validates :postalcode, presence: true, format: {with: /\b\d{5}\b/, message: "is invalid, please enter a correct Postal Code"}

    validate  :is_adult?

    enum :doc_kind, {dni: 0, driver_license: 1, passport: 2}
    enum :role, {admin: 10, customer: 20, premium_customer: 30, blocked: 1, banned: 0}, default: :customer
    
    def is_adult?
        my_bday = Date.parse(birthdate) rescue nil
        return false if my_bday.blank?
         
        if !(((Date.today - 18.year) >= my_bday) && (Date.today - 100.year) <= my_bday)
          errors.add(:birthdate, "User is not adult")
        end 
        
    end

end
