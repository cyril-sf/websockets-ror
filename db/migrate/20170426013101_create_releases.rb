class CreateReleases < ActiveRecord::Migration[5.0]
  def change
    create_table :releases do |t|
      t.string :project
      t.string :version

      t.timestamps
    end
  end
end
