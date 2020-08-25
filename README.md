#config/database.yml
#seed.rb (admin)
#for create CRUD in backoffice
rails g model Article title body:text
rails g scaffold_controller Backoffice::Articles title:string body:text --model-name=Article
