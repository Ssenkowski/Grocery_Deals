class MarcsScraper < ApplicationRecord
    attr_accessor :item, :price, :url, :store

  @@doc = Nokogiri::HTML(open("http://www.marcs.com/Weekly-Ad"))

  @@store = []
  @@items = []
  @@price = []
  @@url = []
  #def initialize(item = nil, url = nil, price = nil)
  #  @item = item
  #  @url = url
  #  @price = price
  #end

  def self.items
    item = @@items[0]
    item
  end

  def self.index
    @@items
  end

  def self.price
    price = @@price.flatten
    price
  end

  def self.url
    url = @@url.flatten
    url
  end

  def self.scrape_url
      urls = []
    @@doc.search("div.field-name-field-card-item a @href").each do |u|
      weblinks = []
      weblinks << u.value
      urls << weblinks
    end
    url = urls.flatten
    @@url << url
  end

  def self.scrape
      item_withprice = []
    # @@doc.search("div.field-name-field-card-item a").each do |event|
    #   event_string = event.to_s.split('>')
    #   event_item = event_string[1].split('<')[0]
    #   block_items_withprice = []
    #   block_items_withprice << event_item
    #   items_withprice << block_items_withprice
    # end
    # items = item_withprice.flatten
    # item = items.map.with_index {|item, index| "#{index +1}. #{item}"}
    # @@items << item
    # puts item[0..11]
  end
  #
  # def self.scrape_price
  #     price_clean = []
  #   @@doc.search("div.field-card-mobile-price").each do |d|
  #     price_string = d.to_s.split('>')
  #     price = price_string[1].split('<')[0]
  #     price_clean_block = []
  #     price_clean_block << price
  #     price_clean << price_clean_block
  #   end
  #    prices = price_clean.flatten
  #    price = prices.map {|item| "#{item}"}
  #    @@price << price
  #   #binding.pry
  # end



  #end

  #Saved to potentially also scrape the natural history museum and botanical gardens
    # self.scrape_naturalhx
    #  doc = Nokogiri::HTML(open("https://www.cmnh.org/visit/calendar"))
    #  item = @@doc.search("span.item-of-summary").text
    #  price =
    #  url =
    #  @@event << item
    #  @@event << price
    #  @@event << url
    #  binding.pry
    #end#
    #

    #def self.scrape_botanical
    #  doc = Nokogiri::HTML(open("https://www.cbgarden.org/calendar-of-items.aspx"))
    #  item = @@doc.search("td.days a href").text
    #  price =
    #  url =
    #  @@event << item
    #  @@event << price
    #  @@event << url
    #  binding.pry
    #end#

    #def self.scrape_all
    #  self.scrape_art
    #  self.scrape_botanical
    #  self.scrape_naturalhx#

    #end#

    #end

  end
end
