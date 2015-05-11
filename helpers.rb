def say_custom(tag, text)
  ; puts "\033[1m\033[36m" + tag.to_s.rjust(12) + "\033[0m" + "  #{text}"
end

def say_recipe(name)
  ; puts "\033[1m\033[36m" + "recipe".rjust(12) + "\033[0m" + "  Running #{name} recipe..."
end
