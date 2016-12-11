class Article < ApplicationRecord
    has_many :headers
    has_many :images
    has_many :paragraphs


    def self.documents
        Article.includes(:images, :headers, :paragraphs).map(&:document)
    end

    def document
        {article: {id: self.id, title: self.title, date: self.posted_on, content: [self.images, self.headers, self.paragraphs].flatten.sort { |a, b| a.sort_order <=> b.sort_order }}}
    end
end


