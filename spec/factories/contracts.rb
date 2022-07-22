FactoryBot.define do
  factory :contract do
		user {create(:user)}
    title {"Contracto Coche"}
    desc {"Contrato alquiler de coche"}
    kind {"Coches"}
    status {0}
  end
end
