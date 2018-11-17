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
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2018_11_17_183017) do
=======
ActiveRecord::Schema.define(version: 2018_11_17_184633) do
>>>>>>> origin/integration

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "questions", force: :cascade do |t|
    t.string "option0"
    t.string "option1"
    t.string "option2"
    t.string "option3"
    t.integer "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< HEAD
    t.string "title"
=======
    t.bigint "quiz_id"
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
>>>>>>> origin/integration
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "quiz_id"
    t.integer "score"
    t.integer "attempts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_results_on_quiz_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

<<<<<<< HEAD
  add_foreign_key "results", "quizzes"
  add_foreign_key "results", "users"
=======
  add_foreign_key "questions", "quizzes"
  add_foreign_key "quizzes", "users"
>>>>>>> origin/integration
end
