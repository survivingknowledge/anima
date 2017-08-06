class Novel < ApplicationRecord

  def to_param
    code
  end
end
