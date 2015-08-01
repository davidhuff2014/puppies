namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [Order].each(&:delete_all)

    Order.populate 5000 do |order|
      order.name     = Faker::Name.name
      order.address  = Faker::Address.street_address
      order.email    = Faker::Internet.email
      order.pay_type = ['Check', 'Credit card', 'Purchase order']
    end

  end
end