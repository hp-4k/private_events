class AddOwnerIdToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :owner, index: true
  end
end
