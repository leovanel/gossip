
class View
  

  def create_gossip
    
    puts "quel est ton nom?"
    author=gets.chomp
    
    

    puts "saisi le contenu :"
    content=gets.chomp
    

    params=Hash.new
    params[author]=content
    

    return params
  end

  def index_gossip(array_all)
     
    array_all.each do |gossip|
      p gossip
    end
    
  end

  def show_delete_gossip(array_all)
    i=1
    
    array_all.each do |gossip|
      
      p  i 
      p gossip
      p
      i=i+1      
    end
    puts "entrer le numéro du gossip à supprimer:"
    index_saisi = gets.chomp.to_i
    
    return index_saisi
  end
end
