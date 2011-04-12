class CreateMessagesTable < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      	t.references :received_messageable, :polymorphic => true
		t.integer :sender_id
		t.string :subject
		t.text :body
		t.boolean :opened, :default => false
		t.boolean :deleted, :default => false
		t.timestamps
    end

    add_index :messages, [:received_messageable_id, :sender_id], :name => "inbox_idx"
  end

  def self.down
    drop_table :messages
  end
end
