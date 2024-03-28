class SessionUser < ApplicationRecord
  belongs_to :session
  belongs_to :shared_session, class_name: "Session", optional: true
end
