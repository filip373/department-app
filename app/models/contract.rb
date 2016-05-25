class Contract
  include Her::Model
  belongs_to :showroom
  include_root_in_json true
end
