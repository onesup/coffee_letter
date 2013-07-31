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

ActiveRecord::Schema.define(:version => 20130713133006) do

  create_table "letters", :force => true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "sender_name"
    t.string   "sender_address"
    t.string   "sender_phone"
    t.string   "receiver_name"
    t.string   "receiver_phone"
    t.string   "receiver_address"
    t.string   "content"
    t.string   "express"
    t.boolean  "is_public"
    t.integer  "like_count"
    t.integer  "paper_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
