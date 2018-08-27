# Term frequency - inverse document frequency:
# A measure of how important a term is to a document in a collection of documents
# (the importance increases proportionally to the term frequency in the document,
# but decreases with the frequency of the word across documents)

def tfidf(term, document, documents)
  num = tf(term, document) * idf(term, documents)
  format("%.2f", num)
end

# Term frequency (simple version):
# the number of times a term occurs in a document

def tf(term, document)
  document.split(/[\s-]/).count { |word| word.downcase == term }
end

# Inverse document frequency:
# measure of how much information the word provides,
# based on the number of documents in which it occurs
# (the rarer it is, the more information it provides)

def idf(term, documents)
  number_of_documents = documents.length
  number_of_documents_with_term = documents.count { |d| tf(term, d) > 0 }

  Math.log(number_of_documents.to_f / number_of_documents_with_term)
end

# Very simple example

document1 = "Schrödinger's cat is a thought experiment often featured in discussions of the interpretation of quantum mechanics. The Austrian physicist Erwin Schrödinger devised " +
"it in 1935 as an argument against the Copenhagen interpretation of quantum mechanics, which states that an object in a physical system can simultaneously exist in all possible configurations, " +
"a state called quantum superposition, and only observing the system forces the object into just one of those possible states. Schrödinger disagreed with this interpretation. In particular, " +
"quantum superposition could not work with larger objects. As an illustration, he presented a scenario with a cat in a sealed box, whose fate was linked to a subatomic event that may or may not occur. " +
"In a quantum superposed state of the subatomic particles, the cat would be both alive and dead, until someone opened the box and observed it."

document2 = "The domestic cat is a small, furry, carnivorous mammal. The term cat can, however, also refer to wild cats, which include animals like lions, tigers and leopards. " +
"Cats are claimed to have a lower social IQ than dogs but can solve more difficult cognitive problems and have a longer-term memory. International Cat Day is celebrated on August 8. " +
"Famous cats include Schrödinger's cat as well as Pudding and Butterscotch, which occur in some of the Launch School assignments."

document3 = "One of the core values that sets Launch School apart from some other coding schools out there is our emphasis on Mastery-based Learning. If the key to becoming a competent and confident Software Engineer " +
"is deep understanding of first principles, then the key to acquiring that understanding is through Mastery-based Learning. The core of Mastery-based Learning is replacing time with mastery. There's no graduation, " +
"but a continual learning journey of micro-improvements. At Launch School, we're not trying to catch a wave or take advantage of a surge in demand. Instead, we're trying to focus on things that'll be useful to you for decades to come, " +
"such as a systematic problem-solving approach or learning how to deconstruct a programming language or building sound mental representations of how web application work. Everything we're trying to do at " +
"Launch School is with an eye towards sustainable studying habits and building skills for a long-term career."

documents = [document1, document2, document3]

# The higher the tf-idf score of a term for a document, the more informative
# it is for that document.
# E.g. when someone searches for the term 'cat' in your document collection,
# you want to return document1 and document2, but not document3.
# For the term 'quantum mechanics', on the other hand, you only want to return document1.

# expected outputs:
puts tfidf("cat", document1, documents) # ~ 1.2
puts tfidf("cat", document2, documents) # ~ 1.6
puts tfidf("cat", document3, documents) # 0

puts tfidf("quantum", document1, documents) # ~ 5.5
puts tfidf("quantum", document2, documents) # 0
puts tfidf("quantum", document3, documents) # 0

puts tfidf("mastery", document1, documents) # 0
puts tfidf("mastery", document2, documents) # 0
puts tfidf("mastery", document3, documents) # ~ 3.3

puts tfidf("some", document1, documents) # 0
puts tfidf("some", document2, documents) # ~ 0.4
puts tfidf("some", document3, documents) # ~ 0.4

#
# When go through the whole program, I didn't find logical error, and the outputs are not totally wrong, all non-zero output are correct except for decimal numbers
# Then I notice the `/` method in line 26
# `number_of_documents` is apparent integer, so does `number_of_documents_with_term`
# - when number_of_documents > number_of_documents_with_term the return value is another integer although may not be accurate
# - but when number_of_documents < number_of_documents_with_term, the return value is 0
# - so the return value of `number_of_documents.to_f / number_of_documents_with_term` is either 0 or an integer that greater or equal to 1
#   - the return value of `Math.log 0` is ` -Infinity`
#
# We can pass 0, 1, 2 to `Math.log()` to see what the results may be:
#
# 2.5.0 :013 > Math.log 0
#  => -Infinity
# 2.5.0 :014 > Math.log 1
#  => 0.0
# 2.5.0 :015 > Math.log 2
#  => 0.6931471805599453
# 2.5.0 :016 >
#
# When observing the test documents and terms, every term occurs at least in one document
# So the return value of `number_of_documents_with_term` will not be 0(at least 1)
# And the return value of `number_of_documents` is 3 in this case
# Above all, in this case the possible minimal return value of (number_of_documents / number_of_documents_with_term) is 0
# This will lead the return value of tfidf(term, document, documents) to be 0
#
# As I mentioned the reason we get so many zeros is because we are merely use integer to do the calculation
# If we turn to use float the results will be more accurate, so we can change the line 26 to
#
# `Math.log(number_of_documents.to_f / number_of_documents_with_term)`

# To standardize the ouput I change the first method to
#
# def tfidf(term, document, documents)
#   num = tf(term, document) * idf(term, documents)
#   format("%.2f", num)
# end
