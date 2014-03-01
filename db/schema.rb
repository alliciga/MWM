# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140301184341) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "drivers", :force => true do |t|
    t.date     "lastcheckdate"
    t.string   "phone"
    t.string   "type"
    t.string   "certid"
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "historyrecord", :id => false, :force => true do |t|
    t.integer  "yljgid",                    :null => false
    t.string   "vehiclenum", :limit => 100, :null => false
    t.string   "sim",        :limit => 20
    t.string   "yljgname",   :limit => 200
    t.datetime "starttime",                 :null => false
    t.datetime "endtime"
  end

  create_table "layer", :id => false, :force => true do |t|
    t.integer "topology_id",                                  :null => false
    t.integer "layer_id",                                     :null => false
    t.string  "schema_name",    :limit => nil,                :null => false
    t.string  "table_name",     :limit => nil,                :null => false
    t.string  "feature_column", :limit => nil,                :null => false
    t.integer "feature_type",                                 :null => false
    t.integer "level",                         :default => 0, :null => false
    t.integer "child_id"
  end

  add_index "layer", ["schema_name", "table_name", "feature_column"], :name => "layer_schema_name_table_name_feature_column_key", :unique => true

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.float    "lon"
    t.float    "lat"
    t.string   "legalperson"
    t.string   "phone"
    t.string   "contacts"
    t.string   "contactsphone"
    t.float    "weight"
    t.integer  "vehicle_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "spatial_ref_sys", :id => false, :force => true do |t|
    t.integer "srid",                      :null => false
    t.string  "auth_name", :limit => 256
    t.integer "auth_srid"
    t.string  "srtext",    :limit => 2048
    t.string  "proj4text", :limit => 2048
  end

  create_table "topology", :force => true do |t|
    t.string  "name",      :limit => nil,                    :null => false
    t.integer "srid",                                        :null => false
    t.float   "precision",                                   :null => false
    t.boolean "hasz",                     :default => false, :null => false
  end

  add_index "topology", ["name"], :name => "topology_name_key", :unique => true

  create_table "vehicles", :force => true do |t|
    t.date     "nextcheckdate"
    t.date     "lastmaintdate"
    t.string   "videophone"
    t.string   "gpsphone"
    t.string   "name"
    t.integer  "vehicletype_id"
    t.integer  "driver_id"
    t.integer  "worker_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "vehicletypes", :force => true do |t|
    t.integer  "maintcycle"
    t.float    "fuel"
    t.float    "capacity"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "workers", :force => true do |t|
    t.date     "lastcheckdate"
    t.string   "phone"
    t.string   "type"
    t.string   "certid"
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "yljg", :primary_key => "gid", :force => true do |t|
    t.string  "name",          :limit => 254
    t.integer "the_geom",      :limit => 0
    t.integer "id",                           :null => false
    t.integer "flag"
    t.string  "legalperson",   :limit => 16
    t.string  "address",       :limit => 254
    t.string  "phone",         :limit => 16
    t.string  "contacts",      :limit => 16
    t.string  "contactsphone", :limit => 16
    t.decimal "weight"
    t.integer "vehicleid"
  end

  create_table "yljg_dontremove", :id => false, :force => true do |t|
    t.integer "gid",                          :null => false
    t.string  "name",          :limit => 254
    t.integer "the_geom",      :limit => 0
    t.integer "id",                           :null => false
    t.integer "flag"
    t.string  "legalperson",   :limit => 16
    t.string  "address",       :limit => 254
    t.string  "phone",         :limit => 16
    t.string  "contacts",      :limit => 16
    t.string  "contactsphone", :limit => 16
    t.decimal "weight"
    t.integer "vehicleid"
  end

  create_table "yljg_real", :id => false, :force => true do |t|
    t.integer  "yljgid",     :null => false
    t.integer  "status"
    t.datetime "updatetime"
  end

end
