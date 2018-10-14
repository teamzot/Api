class ChangeJobFunctionType < ActiveRecord::Migration[5.2]
  def change
    change_column :offers, :job_function, :string
  end
end
