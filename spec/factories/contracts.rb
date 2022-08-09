FactoryBot.define do
  factory :contract do
		owner {create(:user)}
    beneficiary {create(:user)}
    title {"Contracto Coche"}
    desc {"Contrato alquiler de coche"}
    kind {"Coches"}
    status {:drafted}
  end
end
