
    #------------------------ NTU Rails 277 期 quiz #3 ----------------------
    1.
    Q:請解釋 database.yml, routes.rb, 和 Gemifle 分別是什麼？ 他們分別在一個 Rails 專案裡的什麼位置？ 他們為什麼對一個 Rails 專案如此重要？
    A:
        (a) project/config/database.yml：is a file you can specify all the information needed to access your database:
        Ex: development:
            <<: *default
            database: db/development.sqlite3
        (b) project/config/routes.rb: is used to control every single aspect of your URLs ( most of them using RESRful routing).
        Ex: get "users", to: "users#index"
        (c) project/Gemfile：is a list of all gems that you want to include in the project. It is used with bundler (also a gem) 
        to install, update, remove gems, related gems, and their version, bundle result will be loged in Gemfile.lock file。

    2.
    Q:MVC 架構裡的 M, V, 和 C 分別代表什麼？
    A: 
    The MVC( Model, View, Controller) principle divides the application into three separate but closely cooperative subsystems.
    (a) M：Model, is implemented in ActiveRecord library, which provides an interface and binding between the tables in a relational database.
    (b) V：View, is triggered by a controller's decision to present the data.
    (c) C：Controller, it directs traffic by querying the models for specific data, and organizing that data (searching, sorting, 
    messaging it) into a form that fits the needs of a given view.

    3.
    Q:請解釋 CRUD 是哪四個字的縮寫？
    A:
    Create, Read, Update and Delete

    4.
    Q:請問在 routes.rb 裡面加入以下程式碼會產生出哪一些 url？ (提示：在 browser 輸入http://localhost:3000/rails/info/routes)
    resources :users
    A:
    get 'users' => 'users#index'
    post 'users' => 'users#create'
    get 'users' => 'users#new', as: :new_user
    get 'user/:id/edit' => 'user#edit', as: :edit_user
    get 'users/:id' => 'users#show', as: :user
    put 'user/:id' => 'user#update'
    patch 'user/:id' => 'user#update'
    delete 'users/:id' => 'user#destroy'

    5.
    Q:請解釋 model 檔案和 migration 檔案的差別？
    A:
    (a) Model file：is the M in MVC , is the Active Record  which is the layer of the system responsible for representing business data 
    and logic.
    Ex: class User < ActiveRecord::Base
          has_many :post1s   
        end
    (b) Migration file：is used by Active Record  to evolve your database schema over time (need to run rake db:migrate to create the 
    table in database), instead of writing schema in pure SQL.
    EX: class CreateUsers <ActiveRecord::Migration
          def change
            create_table :users do |t|
              t.string :name
            end
          end
         end
        
    6.
    Q:若今天發現一個 migration 檔寫錯，請問我應該用什麼指令回復到上一個版本的 migration? 
    A:
    rake db:rollback

    7.
    Q:假設今天
        我要在資料庫裡產出一個叫 group 的資料表
        裡面包括的欄位名稱和相對應的資料型別是： name (string), description (text), members (integer)
        請寫出一個能產生出以上需求的 migration 檔
    A:
    class CreateOrders < ActiveRecord::Migration 
      def change 
        create_table :groups do |t| 
          t.string :name 
          t.text :description 
          t.integer :member 
        end 
      end 
     end

    8.
    Q:請解釋什麼是 ActiveRecord?
    A:
    Active Record is the M(the model) in MVC, it is an implementation of the "Active Record pattern" which itself is a description of an 
    Object Relational Mapping system.

    9.
    Q:若今天需要為 Project 和 Issue 這兩個 Model 建立一對多的關係，請寫出實作上所需要的 migratiion 和 model 檔案
    A:
      class Project < ApplicationRecord
        has_many :issues
      end
      class Issue < ApplicationRecord
        belongs_to :project
      end

    10.
    Q:若今天我有以下 model 檔：
    class User < ActiveRecord::Base
      has_many :groups_users
      has_many :groups, through: :groups_users 
    end
    請寫出和這個 model 檔相關連的 model 檔，以及這些 model 檔所需要的資料庫欄位 
    A:
    class Group < ActiveRecord::Base
      has_many :groups_users
      has_many :users, through: :groups_users 
      validates :group_name, presence: true
    end
    class Group_user < ActiveRecord::Base
      belongs_to :user
      belongs_to :group
      validates :user_id, presence: true
      validates :group_id, presence: true
    end

    11.
    Q:延續第10題，如果需要讓一個叫 "Bob" 的使用者產生一個名字叫做 "Rails is Fun" 的社團，應該如何在 rails console 裡實作出來？
    A:
    User.create(name: "Bob")
    Group.creat(group_name: "Rails is Fun")
    Group_user.create(user_id: 1, group_id: 1)

    12.
    Q:延續第11題，請寫一段程式碼確保使用者在建立新社團時社團名不可以是空白，而且不能超過50個字
    A:

    class Group < ActiveRecord::Base
      validates :group_name, presence: true
      validates :group_name, length: { maximum: 50 }
    end

