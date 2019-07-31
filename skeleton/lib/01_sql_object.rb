require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns

    @cols ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    @cols[0].map{|c| c.to_sym}


  end



  def self.finalize!
    all_cols = self.columns

    all_cols.each do |col|

      define_method(col) do 
        attributes[col]
      end

      define_method( "#{col}=") do |value|
        attributes[col] = value
      end
    end



      
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    self.to_s.downcase + "s"
  end

  def self.all

  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    params.each do |attr_k, attr_v|
      self.send.(attr_k.to_sym)
      if !self.columns.include?(attr_k)
        raise "unknown attribute '#{attr_k}'"
      end
    end
      
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
