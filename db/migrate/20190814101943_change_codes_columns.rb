class ChangeCodesColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :codes, :password_digest, :string
    remove_column :codes, :code_digest, :string 
  end
end
