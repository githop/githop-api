# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

articles_json = File.read(File.join(Rails.root, 'db', 'articles.json'))
articles_hash = JSON.parse(articles_json);

articles_hash["articles"].each do |articleJson|
    puts "this is  an article #{articleJson['article']['title']}"
    record = Article.new;
    record.id = articleJson["article"]["id"];
    record.posted_on = articleJson["article"]["date"]
    record.title = articleJson["article"]["title"]

    articleJson["article"]["contents"].each do |content|
        if content['type'] == 'I'
            record.images << Image.create(kind: 'Image', sort_order: content['order'], href: content['href'], title: content['title'])
        end

        if content['type'] == 'P'
            record.paragraphs << Paragraph.create(kind: 'Paragraph', sort_order: content['order'], text: content['text'])
        end

        if content['type'] == 'H'
            record.headers << Header.create(kind: 'Header', sort_order: content['order'], text: content['text'])
        end
    end

    record.save
end
