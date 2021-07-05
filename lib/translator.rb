require 'pry'
require 'yaml'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  
  emoticon_library = {
    get_meaning: {},
    get_emoticon: {}
  }
  
  emoticons.each do |expression, emoticon_value|
    emoticon_library[:get_meaning][emoticon_value[1]] = expression
    emoticon_library[:get_emoticon][emoticon_value[0]] = emoticon_value[1]
  end
  emoticon_library
  
  # the get_meaning key returns a hash as its value, that hash contains the japanese
  # emoticons as keys and the value of those keys are the expressions they are intended to represent
  # the get_emoticon key returns a hash as its value, that hash contains the english emoticons as
  # keys and the value of those keys are the japanese emoticons
  
  
  # binding.pry
end

def get_japanese_emoticon(file_path, english_emoticon)
  emoticon_library = load_library(file_path)
  
  if emoticon_library[:get_emoticon].include?(english_emoticon)
    emoticon_library[:get_emoticon][english_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
  
  #binding.pry
  
end

def get_english_meaning(file_path, japanese_emoticon)
  emoticon_library = load_library(file_path)
  
  if emoticon_library[:get_meaning].include?(japanese_emoticon)
    emoticon_library[:get_meaning][japanese_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end