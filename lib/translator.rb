require "yaml"

def load_library(file)
  path = YAML.load_file(file)
  library = {:get_meaning => {}, :get_emoticon => {}}
    
  path.each do |meaning, emote_array|
    library[:get_meaning][emote_array[1]] = meaning
    library[:get_emoticon][emote_array[0]] = emote_array[1]
  end
  return library
end

def get_japanese_emoticon(file, emote)
  if result = load_library(file)[:get_emoticon][emote]
    return result
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emote)
  if result = load_library(file)[:get_meaning][emote]
      return result
  else
    return "Sorry, that emoticon was not found"
  end
end