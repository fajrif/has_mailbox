class CreateMessageCopiesTable < ActiveRecord::Migration
  def self.up
    create_table :message_copies do |t|
		t.references :sent_messageable, :polymorphic => true
		t.integer :recipient_id
		t.string :subject
		t.text :body
		t.timestamps
    end

    add_index :message_copies, [:sent_messageable_id, :recipient_id], :name => "outbox_idx"
  end

  def self.down
    drop_table :message_copies
  end
end
