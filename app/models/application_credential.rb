class ApplicationCredential < ActiveRecord::Base
  attr_accessible :client_id, :client_secret, :redirect_uri
end
