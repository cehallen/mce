json.array! @sentences



json.array! @sentences do |sentence|
  sentence.previous
  sentence.content
  sentence.following
end
