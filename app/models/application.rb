class Application < ActiveRecord::Base

  attr_accessible :name, :slug, :callback_url 

end
