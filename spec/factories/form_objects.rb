FactoryBot.define do
  factory :form_object do
    item_id                  {Faker::Number.between(from: 1, to: 100)}
    user_id                  {Faker::Number.between(from: 1, to: 100)}
    postal_code              {'111-1111'}
    area_id                  {Faker::Number.between(from: 2, to: 48)}
    municipality             {'横浜市青葉区'}
    address                  {'2-2'}
    building_name            {'ハウス'}
    telephone_number         {'00000000000'}
    token                    {"tok_abcdefghijk00000000000000000"}
  end
end
