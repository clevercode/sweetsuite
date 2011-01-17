Factory.define :user do |user|
  user.first_name "Dexter"
  user.last_name "Morgan"
  user.password "password"
  user.password_confirmation { |u| u.password }
  user.sequence(:email) { |n| "user#{n}@example.com" }
end
