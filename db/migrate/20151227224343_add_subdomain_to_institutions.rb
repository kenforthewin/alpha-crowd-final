class AddSubdomainToInstitutions < ActiveRecord::Migration
  def change
    add_column :institutions, :subdomain, :string
  end
end
