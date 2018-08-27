# text in 'mad_words.txt'
# The {adj} {noun} {adv} {verb}s the {adj} {noun}, who {adv} {verb}s his {noun} and {verb}s {adv}.

NOUNS = %w[medicine dog face phone tissue bag TV pilot cook]
VERBS = %w[hit look sleep shout speak hitchhike mount eat]
ADJS = %w[nice bad mediocre proportional loose crazy]
ADVS = %w[readily madly frantically beautifully notoriously slowly quickly]

# def noun
#   NOUNS.sample
# end
#
# def verb
#   VERBS.sample
# end
#
# def adj
#   ADJS.sample
# end
#
# def adv
#   ADVS.sample
# end

def insanely_saying
  f = File.read("./mad_words.txt")
  f.gsub!(/{(.+?)}/) do
    con = ($1 + "s").upcase
    eval(con).sample
  end
  puts f
end

insanely_saying


# standard solution

# Text should be
# "The %{adj} %{noun} %{adv} %{verb}s the %{adj} %{noun}, who %{adv} %{verb}s his %{noun} and %{verb}s %{adv}."

# File.open("./mad_words.txt") do |file|
#   file.each do |line|
#     puts format(line, noun: NOUNS.sample,
#                       verb: VERBS.sample,
#                       adj: ADJS.sample,
#                       adv: ADVS.sample
#     )
#   end
# end
