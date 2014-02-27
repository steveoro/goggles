require 'date'

FactoryGirl.define do

  factory :swimming_pool do
    name "Comunale Melato"
    address "via Melato, Reggio Emilia"
    zip "42100"
    nick_name "comunale melato"
    lanes_number 10
    has_multiple_pools true
    has_open_area true
    has_bar true
    has_restaurant_service true
    has_gym_area true
    has_children_area true
  end

  factory :swimmer_level_type do
    code  "MASTER"
    level 100
  end
  # ---------------------------------------------------------------------------

end
