class AddOrganizerToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :organizer_id, :integer, references: :users
    add_index :meetings, :organizer_id
  end
end
