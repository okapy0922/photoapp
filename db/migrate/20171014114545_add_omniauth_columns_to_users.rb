class AddOmniauthColumnsToUsers < ActiveRecord::Migration
  def change
    ##null: false,default: ""
     #(マイグレーションファイル内の「uid」と「provider」カラムに”未入力を許さない”NOT NULL制約と"未入力時は空として扱う"デフォルト値を設定)
    add_column :users, :uid, :string, null: false, default: ""
    add_column :users, :provider, :string, null: false, default: ""
    add_column :users, :image_url, :string
    ##add_index :users, [:uid, :provider], unique: true
     #(マイグレーションファイル内の「uid」と「provider」カラムにインデックス（索引）を設定して、”同じものは複数存在できないようにする”ユニーク制約を設定)
    add_index :users, [:uid, :provider], unique: true
  end
end
