class NlApi::HistoricMunicipality
  attr_reader :code, :name, :code_after_merge

  def initialize(attributes)
    @code = attributes[:code]
    @name = attributes[:name]
    @code_after_merge = attributes[:code_after_merge]
  end

  def province
    municipality_after_merge.province
  end

  def municipality_after_merge
    NlApi::Municipality.find_by(code: code_after_merge)
  end

  def has_merged?
    !!code_after_merge
  end

  class << self
    include Enumerable
    require 'csv'

    attr_writer :filename

    def filename
      @filename ||= '../../data/BAG_gemeententabel.csv'
    end

    def path
      File.join(File.dirname(File.expand_path(__FILE__)), filename)
    end

    def read_csv
      @store ||= CSV.read(path, headers: true, col_sep: ',').map{ |line|
      NlApi::HistoricMunicipality.new(
        code: line[0].to_i,
        name: line[1],
        code_after_merge: line[2].to_i
      ) }
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