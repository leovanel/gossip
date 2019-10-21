require_relative 'gossip'
require_relative 'view'




class Controller
  def initialize
    @view=View.new
    
    
  end
  def create_gossip
    params= @view.create_gossip
    params.each do |key,value|
      author = key
      content = value
      
      gossip = Gossip.new(author,content)
     
      gossip.save
    end
  end

  def index_gossip
    array_all= Gossip.all
    @view.index_gossip(array_all)   

  end

  def show_delete
    array_all= Gossip.all
    
    index_saisi= @view.show_delete_gossip(array_all) 
    #on récupere l'index saisi par l'utilisateur correspondant au gossip à supprimer
    
    Gossip.delete_gossip(index_saisi)  
    #on appele la methode delete gossip sur l'instance gossip voulue
    return  index_saisi

  end

  
 

end
