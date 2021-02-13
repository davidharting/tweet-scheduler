# Not a db-backed model!

class Current < ActiveSupport::CurrentAttributes
  attribute :user
end

# You can use current to carry data about the current request -
# Would it make sense to build policies / abilities around taking in a "current"?
