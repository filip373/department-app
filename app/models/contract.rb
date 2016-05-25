class Contract
  include Her::Model
  belongs_to :showroom
  include_root_in_json true
  after_find { |c| c.due_date = c.due_date.to_datetime }
end
