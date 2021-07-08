class Product < ApplicationRecord
  require 'csv'

  has_many :comments

  scope :ordered, -> { order(id: :asc) }

  def self.import_csv(file)
    products = []
    CSV.foreach(file.path, headers: true) do |row|
      products << { name: row['Minutos'], price: row['Propuesta'].split('$')[1].to_f }
    end

    create(products)
  end
end
