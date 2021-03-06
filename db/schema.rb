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

ActiveRecord::Schema.define(:version => 20130607143015) do

  create_table "accounts", :force => true do |t|
    t.string   "label"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "key"
  end

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "account_id"
    t.string   "user_type"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "assets", :force => true do |t|
    t.string   "storage_uid"
    t.string   "storage_name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "storage_width"
    t.integer  "storage_height"
    t.float    "storage_aspect_ratio"
    t.integer  "storage_depth"
    t.string   "storage_format"
    t.string   "storage_mime_type"
    t.string   "storage_size"
  end

  create_table "destinatarios", :force => true do |t|
    t.string   "descricao"
    t.string   "identificador"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "account_id"
  end

  create_table "grupo_notificacaos", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "identificador"
    t.integer  "account_id"
  end

  create_table "notificacaos", :force => true do |t|
    t.string   "titulo"
    t.text     "conteudo"
    t.integer  "grupo_notificacao_id"
    t.integer  "subgrupo_notificacao_id"
    t.string   "tipo"
    t.boolean  "manter_visivel"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "account_id"
    t.date     "ativo_ate"
    t.boolean  "contar_como_nao_lido"
    t.date     "ativo_a_partir_de"
  end

  add_index "notificacaos", ["grupo_notificacao_id"], :name => "index_notificacaos_on_grupo_notificacao_id"
  add_index "notificacaos", ["subgrupo_notificacao_id"], :name => "index_notificacaos_on_subgrupo_notificacao_id"

  create_table "notificacoes_destinatarios", :force => true do |t|
    t.integer "notificacao_id"
    t.integer "destinatario_id"
  end

  create_table "visualizacaos", :force => true do |t|
    t.datetime "data_hora"
    t.integer  "notificacao_id"
    t.integer  "destinatario_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "visualizacaos", ["destinatario_id"], :name => "index_visualizacaos_on_destinatario_id"
  add_index "visualizacaos", ["notificacao_id"], :name => "index_visualizacaos_on_notificacao_id"

  create_table "visualizacoes", :force => true do |t|
    t.datetime "data_hora"
    t.integer  "notificacao_id"
    t.integer  "destinatario_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "account_id"
    t.string   "visto_por"
  end

  add_index "visualizacoes", ["destinatario_id"], :name => "index_visualizacoes_on_destinatario_id"
  add_index "visualizacoes", ["notificacao_id"], :name => "index_visualizacoes_on_notificacao_id"

end
