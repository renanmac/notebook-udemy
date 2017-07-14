namespace :utils do
  desc "Popular o banco de dados"
  task seed: :environment do
  puts "Criando Tipos ..."
    Kind.create!([{description: "Amigo"}, {description: "Comercial"}, {description: "Outros"}])
  puts "Criando Tipos ... [OK]"

  puts "Criando Contatos ..."
    10.times do |c|
      Contact.create!(
	    name: Faker::Name.name,
	    email: Faker::Internet.free_email,
	    kind: Kind.all.sample,
	    rmk: Faker::Lorem.paragraph
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
      Phone.create!(
	    phone: Faker::PhoneNumber.phone_number,
	    contact: contact
	  )
    end
  puts "Criando Telefones ... [OK]"
  end

end
