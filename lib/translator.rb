# require modules here
require 'yaml'

def load_library(file)
  # code goes here
  translator = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  emoticons = YAML.load_file(file)
  emoticons.each do |meaning,icons|
    english = icons[0]
    japanese = icons[1]
    translator["get_meaning"][japanese] = meaning
    translator["get_emoticon"][english] = japanese
  end
  return translator
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  library = load_library(file)
  if library["get_emoticon"][emoticon]
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  # code goes here
  library = load_library(file)
  if library["get_meaning"][emoticon]
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
