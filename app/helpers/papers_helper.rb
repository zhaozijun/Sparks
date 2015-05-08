require 'rscribd'
module PapersHelper
  
  def scribd_download_link(doc_id)
    Scribd::API.instance.key = '6a6ssxkqj19vilb8m2jr3semuffnvg'
    Scribd::API.instance.secret = 'sec-u7z2fe34090u51k7hilqk8h3dp'
    
    begin
      user = Scribd::User.login 'hamidhasan1ahmed', 'zt6AQ3BKa6WqtGFf'
      print doc_id
      doc = user.find_document(doc_id)
      #doc = Scribd::Document.find(doc_id)
      url = doc.download_url
      return url
    rescue Scribd::ResponseError => e
      print "failed code=#{e.code} error='#{e.message}'"
      return nil
    end
  end
  
  
end
