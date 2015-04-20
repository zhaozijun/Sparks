require 'rscribd'
module PapersHelper
  
  def scribd_upload_paepr
    Scribd::API.instance.key = '6a6ssxkqj19vilb8m2jr3semuffnvg'
    Scribd::API.instance.secret = 'sec-u7z2fe34090u51k7hilqk8h3dp'
    
  end
  
  
end
