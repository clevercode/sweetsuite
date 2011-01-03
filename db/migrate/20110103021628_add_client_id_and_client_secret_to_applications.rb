class AddClientIdAndClientSecretToApplications < ActiveRecord::Migration
  def self.up
    rename_column :applications, :api_key, :client_id 
    add_column    :applications, :client_secret, :string
  end

  def self.down
    rename_column :applications, :client_id, :api_key
    remove_column :applications, :client_secret
  end
end
