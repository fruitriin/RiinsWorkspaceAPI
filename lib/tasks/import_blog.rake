namespace :import_blog do
  require 'rexml/document'
  require 'active_support'
  require 'active_support/core_ext'
  require 'pry-rails'

  desc 'インポート'
  task default: :environment do
    file = File.open('app/static/blog-08-14-2020.xml')
    doc = REXML::Document.new(file)
    hash = Hash.from_xml(doc.to_s)
    posts = hash['feed']['entry'].filter do |e|
      if e['category'].is_a? Array
        e['category'].any? do |c|
          c['term'] == 'http://schemas.google.com/blogger/2008/kind#post'
        end
      else
        e['category']['term'] == 'http://schemas.google.com/blogger/2008/kind#post'
      end
    end
    posts.each do |p|
      a = Article.new
      a.created_at = p['published']
      a.updated_at = p['updated']
      a.body = p['content']
      a.title = p['title']

      unless p['category'].is_a? Array
        a.save
        next
      end
      p['category'].each do |c|
        next if c['term'] == 'http://schemas.google.com/blogger/2008/kind#post'

        a.tags.push(Tag.find_or_create_by(name: c['term']))
      end
      a.save
    end
  end
end
