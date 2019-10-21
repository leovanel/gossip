require_relative 'controller'

class Router

  def initialize 
    @controller=Controller.new

  end
  def perform

    while true 

      puts "Tu veux faire quoi jeune mouss' ?"
      puts""
      puts""
      puts "1. Je veux créer un gossip"
      puts""
      puts""
      puts "2.Je veux afficher tous les gossips"
      puts""
      puts""
      puts "3.Je veux supprimer un gossip"
      puts""
      puts""
      puts "4. Je veux quitter l'app"
      puts""
      choice = gets.chomp.to_i

      case choice
      when 1
        puts "tu vas créer un nouveau gossip"
        @controller.create_gossip
      when 2
        puts"tu vas voir tous les gossips!"
        @controller.index_gossip
      when 3
        puts"choisis le gossip que tu veux supprimer:"
        @controller.show_delete
      when 4
        puts "à bientot"
        break
      else 
        puts "ce choix n'existe pas"
      end
    end
  end

end

      


    
