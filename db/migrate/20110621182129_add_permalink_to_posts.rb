class AddPermalinkToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :permalink, :string

    Post.all.each do |p|
      p.update_attribute("permalink", p.title.parameterize)
    end
  end

  def self.down
    remove_column :posts, :permalink
  end
end
