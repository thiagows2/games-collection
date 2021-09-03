namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      %x(rails dev:add_console_types)
      %x(rails dev:add_consoles)
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end
  
  desc "Cadastra os consoles"
  task add_consoles: :environment do
    show_spinner("Cadastrando os consoles...") do
      consoles = [
                { 
                  description: "Playstation 3",
                  acronym: "PS3",
                  url_image: "https://clipground.com/images/ps3-png-1.jpg",
                  console_type: ConsoleType.find_by(acronym: 'PS')
                },
                { 
                  description: "Playstation 4",
                  acronym: "PS4",
                  url_image: "https://clipground.com/images/ps3-png-1.jpg",
                  console_type: ConsoleType.find_by(acronym: 'PS')
                },
                { 
                  description: "Playstation 5",
                  acronym: "PS5",
                  url_image: "https://clipground.com/images/ps3-png-1.jpg",
                  console_type: ConsoleType.find_by(acronym: 'PS')
                },
                { 
                  description: "XBOX SERIES S",
                  acronym: "XBOX SS",
                  url_image: "https://clipground.com/images/ps3-png-1.jpg",
                  console_type: ConsoleType.find_by(acronym: 'X')
                },
                { 
                  description: "XBOX SERIES X",
                  acronym: "XBOX SX",
                  url_image: "https://clipground.com/images/ps3-png-1.jpg",
                  console_type: ConsoleType.find_by(acronym: 'X')
                }
              ]
      
      consoles.each do |console|
        Console.find_or_create_by!(console)
      end
    end
  end

  desc "Cadastra os tipos de consoles"   
  task add_console_types: :environment do
    show_spinner("Cadastrando tipos de consoles...") do
      console_types = [
        {description: "PLAYSTATION", acronym: "PS"},
        {description: "XBOX", acronym: "X"},
      ]
      
      console_types.each do |console_type|
        ConsoleType.find_or_create_by!(console_type)
      end
    end
  end


  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")    
  end
end