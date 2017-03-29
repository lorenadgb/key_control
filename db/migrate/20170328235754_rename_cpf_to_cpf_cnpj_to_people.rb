class RenameCpfToCpfCnpjToPeople < ActiveRecord::Migration[5.0]
  def change
    rename_column :people, :cpf, :cpf_cnpj
  end
end
