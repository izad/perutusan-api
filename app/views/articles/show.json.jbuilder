json.title @doc.at_css('.title h1').content

if @doc.at_css('.title .subhead').present?
  json.subtitle @doc.at_css('.title .subhead').content
else
  json.subtitle nil
end

if @doc.at_css('.author').present?
  json.author @doc.at_css('.author').content.downcase.titleize
else
  json.author nil
end

json.timestamp @doc.at_css('.dateLine .date').content

if @doc.at_css('.articleLead').present?
  json.lead @doc.at_css('.articleLead').content.strip
else
  json.lead nil
end

json.body ReverseMarkdown.convert(@doc.at_css('#articleBody').to_s.strip).gsub("\n\n \n\n", "\n\n")

if @doc.at_css('.image.top img').present?
  json.photo "http://www.utusan.com.my#{@doc.at_css('.image.top img')[:src]}"
else
  json.photo nil
end

if @doc.at_css('.image.top p').present?
  json.caption @doc.at_css('.image.top p').content
else
  json.caption nil
end
