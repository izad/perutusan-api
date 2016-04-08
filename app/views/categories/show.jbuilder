length = 50

json.metadata do
  json.generated_at DateTime.now.to_s(:db)
  json.total_result length
end

json.articles do
  json.array! @doc.css('.linklist li').slice(0, length) do |node|
    h2 = node.at_css('h2')
    img = node.at_css('img')

    json.id h2.at_css('a')[:href].split('/').last.split('-').last.gsub('.', '_')
    json.title h2.content
    json.timestamp node.at_css('span').content

    if img.present?
      json.photo "#{base_url}#{img[:src].gsub('box_80', 'landscape_650')}"
    else
      json.photo nil
    end
  end
end