
require 'csv'
require 'pry'
require_relative 'controller'




class Gossip
  def initialize(author,content)
    @author=author
    @content=content
    
    
  end

  def save

    if File.exist?("/home/leovanel/Bureau/THP/the_hacking_gossip_ruby_version_POO/db/gossip.csv")    
      CSV.open("/home/leovanel/Bureau/THP/the_hacking_gossip_ruby_version_POO/db/gossip.csv", "a",
      headers:true) do |csv|
                          
        csv << [@author, @content]  
      end  
    else
      CSV.open("/home/leovanel/Bureau/THP/the_hacking_gossip_ruby_version_POO/db/gossip.csv", "a",
      headers: :first_row) do |csv|
        
        csv<< ["author", "content"]
            
        csv << [@author, @content]  
      end
    end
          
       
  end

  def self.all

    gossip_provisoire=[]
    all_gossips=[]
    table = CSV.read("/home/leovanel/Bureau/THP/the_hacking_gossip_ruby_version_POO/db/gossip.csv",headers:true , header_converters: :symbol, converters: :all)
    table.each do |row|  
      params = {author: row[:author], content: row[:content]} 
           
      all_gossips << Gossip.new(params[:author],params[:content])   
                
    end  
    return all_gossips
  end


  def self.index_delete
    params = Hash.new
    all_gossips = self.all
    i=1

    all_gossips.each do |gossip|
      params[i]=gossip   
       
      i=1+1
    end
     
    return params

  end

  def self.delete_gossip(index_saisi)
    
    table= CSV.read("/home/leovanel/Bureau/THP/the_hacking_gossip_ruby_version_POO/db/gossip.csv",headers: :first_row , header_converters: :symbol, converters: :all)
    table.delete_if.with_index do |row, index|
      index == (index_saisi -1)
    end
    
    #enregistrer le csv dans un array table, et supprimmer le gossip voulu de la table 
    
    
    CSV.open("/home/leovanel/Bureau/THP/the_hacking_gossip_ruby_version_POO/db/gossip.csv", "w",
    headers: :first_row) do |csv|
        
      csv<< ["author", "content"]      
      table.each do |row|
        csv.puts row
      end
      
    end
    
    
                           
           
    #écrase le csv existant avec la table dont à été supprimé le gossip

  end

  

end
