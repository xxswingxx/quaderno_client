class ApiClient < ActiveRecord::Base
  attr_accessible :refresh_token, :token, :token_expires_at
end
