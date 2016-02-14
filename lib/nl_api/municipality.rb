class NlApi::Municipality
  attr_reader :code, :name, :province_name, :province_code

  def initialize(attributes)
    @code = attributes[:code]
    @name = attributes[:name]
    @province_name = attributes[:province_name]
    @province_code = attributes[:province_code]
  end

  def province
    self.class.provinces[province_code] ||= NlApi::Province.new(province_code, province_name)
  end

  class << self
    include Enumerable
    require 'csv'

    attr_writer :filename
    attr_writer :provinces

    def filename
      @filename ||= '../../data/gemeentenalfabetisch2016.csv'
    end

    def path
      File.join(File.dirname(File.expand_path(__FILE__)), filename)
    end

    def read_csv
      @store ||= CSV.read(path, headers: true, col_sep: ';').map{ |line|
      NlApi::Municipality.new(
        code: line[0].to_i,
        name: line[1],
        province_name: line[2],
        province_code: line[3].to_i
      ) }
    end

    def provinces
      @provinces ||= {}
    end

    def all
      @all ||= read_csv
    end

    def each(&block)
      all.each(&block)
      self
    end

    def find_by(where)
      field = where.keys.first
      value = where.values.first

      find{ |i| i.send(field.to_sym) == value }
    end

    def find_all_by(where)
      field = where.keys.first
      value = where.values.first

      find_all{ |i| i.send(field.to_sym) == value }
    end
  end
end