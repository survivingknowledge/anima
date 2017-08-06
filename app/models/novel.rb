class Novel < ApplicationRecord
  has_many :chapters

  def to_param
    code
  end
  
end
