FactoryBot.define do
    factory :user do
      nickname {'test'}
      email {'test@exaple'}
      password {'nagano4030'}
      password_confirmation {password}
      birthday  {'1930/2/2'}
      last_name {'村岡'}
      name {'優愛'}
      last_name_katakana {'ムラオカ'}
      name_katakana {'ユウア'}
    end
end
