class Settings
  #static class implementation  http://www.codeproject.com/Articles/551579/Csharp-and-Ruby-Classes#StaticClasses:CreatingaStaticClassinRuby7
 attr_accessor :open_time, :close_time

  def Settings.open_time
    get_setting_string('opening')
  end
  def Settings.close_time
    get_setting_string('closing')
  end

  def self.get_setting_string(value)
    APP_CONFIG[value].to_s
  end
  def self.get_setting_int(value)
    APP_CONFIG[value].to_i
  end
end