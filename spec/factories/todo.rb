FactoryBot.define do

  factory :todo, class: Todo do
 
   sequence(:text){|i| "todo#{i}"}
   sequence(:priority){|i| i % 5 + 1 }
 
  end
 
 end