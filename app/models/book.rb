class Book < ApplicationRecord
  def self.generate_csv
    csv_attributes = ["title", "author"]
#    CSV.generate(headers: true, encoding: "cp932") do |csv|
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      self.all.each do |book|
        csv << csv_attributes.map{|attr| book.read_attribute(attr) }
      end
    end
  end
end
