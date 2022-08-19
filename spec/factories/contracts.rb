FactoryBot.define do
  factory :contract do
		owner {create(:user)}
    beneficiary {create(:user)}
    sequence(:title) {|n| "Car contract #{n}"}
    desc {"Contrato alquiler de coche"}
    kind {"Coches"}
    status {:drafted}
  end
end
