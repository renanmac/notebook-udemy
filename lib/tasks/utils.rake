namespace :utils do
  desc "Popular o banco de dados"
  task seed: :environment do
  puts "Criando Tipos ..."
    Kind.create!([{description: "Amigo"}, {description: "Comercial"}, {description: "Outros"}])
  puts "Criando Tipos ... [OK]"

  puts "Criando Contatos ..."
    100.times do |c|
      Contact.create!(
	    name: Faker::Name.name,
	    email: Faker::Internet.free_email,
	    kind: Kind.all.sample,
	    rmk: LeroleroGenerator.sentence([1,2,3].sample)
	  )
    end
  puts "Criando Contatos ... [OK]"

  puts "Criando Endereços ..."
    Contact.all.each do |contact|
      Address.create!(
	    street: Faker::Address.street_name,
	    city: Faker::Address.city,
	    state: Faker::Address.state,
	    contact: contact
	  )
    end
  puts "Criando Endereços ... [OK]"

  puts "Criando Telefones ..."
    Contact.all.each do |contact|
      (Random.rand(1..5)).times do |p|
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
	        contact: contact
	  )
      end
    end
  puts "Criando Telefones ... [OK]"
  end

end
