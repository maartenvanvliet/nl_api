class NlApi::Province
  attr_accessor :province_code, :province_name

  def initialize(province_code, province_name)
    @province_name = province_name
    @province_code = province_code
  end

  def municipalities
    @municipalities ||=
      NlApi::Municipality.find_all_by(province_code: province_code)
  end
end
