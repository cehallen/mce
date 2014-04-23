  json.array! @sentences do |sentence|
    json.time_marker sentence.time_marker
    json.previous sentence.previous.first.content
    json.content sentence.content
    json.following sentence.following.first.content
  end
