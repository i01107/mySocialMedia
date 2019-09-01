class CreateFellowships < ActiveRecord::Migration[6.0]
  def change
    create_table :fellowships do |t|
      t.references :user
      t.references :following

      t.timestamps
    end
  end
end
