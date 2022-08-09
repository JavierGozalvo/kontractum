FactoryBot.define do
  factory :user do
    name {"Paco"}
    surname {"Gonzalez"}
    doc_id {"35354647N"}
    doc_kind {0}
    sequence(:email) {|n| "email#{n}@gmail.com"}
    birthdate {"3/5/1999"}
    address {"Calle San Onofre"}
    city {"Torrent, Valencia"}
    postalcode {"46900"}
    password {"xxxxxx"}
    role {10}
  end
end
