# encoding: utf-8
class PortalArticle::Script::EventDocsController < Cms::Controller::Script::Publication
  def publish
    return render(:text => "OK")
    
    today = Date.today
    0.upto(12) do |i|
      date = today << i
      uri  = "#{@node.public_uri}#{date.strftime('%Y/%m/')}"
      path = "#{@node.public_path}#{date.strftime('%Y/%m/')}"
      break if !publish_page(@node, :uri => uri, :site => @site, :path => path, :dependent => (0-i).to_s)
    end
    1.upto(12) do |i|
      date = today >> i
      uri  = "#{@node.public_uri}#{date.strftime('%Y/%m/')}"
      path = "#{@node.public_path}#{date.strftime('%Y/%m/')}"
      break if !publish_page(@node, :uri => uri, :site => @site, :path => path, :dependent => (0+i).to_s)
    end
    render :text => "OK"
  end
end
