class Config
  attr_accessor :open_time, :close_time
  @@open =  APP_CONFIG['opening']
  @@close =  APP_CONFIG['closing']
 def open_time
  return @@open
 end
 def close_time
  return @@close
 end

end