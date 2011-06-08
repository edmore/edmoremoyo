class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.text :summary
      t.text :skills
      t.text :education
      t.text :experience

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
