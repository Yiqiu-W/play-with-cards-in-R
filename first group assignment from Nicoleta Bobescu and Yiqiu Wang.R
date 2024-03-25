# work by Nicoleta Bobescu and Yiqiu Wang
# Yiqiu Wang: first draft + self-check + revision


# create two vectors for the card labels and suits
labels <- c(2:10,"J","Q","K","A")
suits  <- c("clubs","spades","hearts","diamonds")

## Question 1 : What data types does the vector ‘labels’ contain

# we use class() to check the data type
class(labels)
# Answer 1 : character

## task 1 :
# use expand.grid() to create a data frame called ‘deck’ 
# containing the two columns/variables ‘label’ and ‘suit’.The first column (‘label’) should be populated with the values from the vector ‘labels’ above, and the second column (‘suit’) should be populated with the values from the ‘suits’ column.
# Use the argument stringsAsFactors=FALSE so that the supplied vectors are stored as vectors of character strings (instead of factors) in the data frame
deck <- expand.grid(label = labels, suit =suits, stringsAsFactors=FALSE)
deck

## task 2 :
# Add a new column ‘card’ to the deck dataframe ‘deck’ 
# that contains the paired values from columns ‘label’ and ‘suit’,
# separated by an underscore and make sure it contains character strings such as “2_hearts”, “3_hearts”, “ 8_clubs”, “Q_diamonds” etc

# use paste()
deck$card <- paste(deck$label, deck$suit, sep="_")

# Inspect the values in this column using ‘deck$card'
deck$card
# Yes, “2_hearts”, “3_hearts”, “ 8_clubs”, “Q_diamonds” are in deck$card
# Or we can use %in% if we just want to do just a few checks
"2_hearts" %in% deck$card 
"3_hearts" %in% deck$card
"8_clubs" %in% deck$card
"Q_diamonds" %in% deck$card 
# all TRUE

## task 3 :
# Create a new column ‘value’ in the ‘deck’ dataframe and populate it with a vector that contains the correct card values for each of the 52 cards

# So use "$", then we have "deck$value"
# We know the value should be 2 to 10 and then 11 to 14 for J Q K A
# For each suit the value should be 2 to 14
# We need to repeat the value number 2 to 14 when we move on from one suit to another 
# So use rep()
deck$value <- rep(2:14)
# a check on if the value of each card is correct
deck

## task 4 :
# Use head() to show the first 15 lines in your data frame
# We cannot use "head(deck)" directly because we will then only have 6 lines
# So we use "head(deck,n)" and make n 15  
head(deck,15)

## task 5 :
# Create a vector ‘allcards’ 
# containing all the character strings in the ‘card’ column from the ‘deck’ data frame(i.e. without any filtering)

# No filtering, so just "deck$card"
allcards <- deck$card
# We can see the length of the vector by using length()
length(allcards)
# 52

## task 6
# create a vector ‘nothearts’ containing the character strings from the ‘card’ column in ‘deck’ that don’t belong to the suit‘hearts’. Verify that the length of this vector is 39.

# use [] to select from deck$card, so deck[]$card
# "don't belong to the suit 'hearts'" so use "!=" 
nothearts <- deck[deck$suit != "hearts", ]$card
# We can see the length of the vector by using length()
length(nothearts)
# or
length(nothearts) == 39 #TRUE
# Yes, it is 39

##  task 7 :
# Similar to task 6, create a vector of ‘card’ values from ‘deck’ where the ‘value’ of the card is less (<) than 10, and name this vector in a suitable way. Verify that its length is 32.

# We can name it " belowten"
# Again, use "deck[]$card"to select the cards we want
belowten <- deck[deck$value < 10, ]$card
# Again, use length() to see the length of this vector
length(belowten)
# or
length(belowten) == 32 #TRUE
#Yes, it is 32

## task 8 :
# Create a character string vector called ‘red_gt6’ with ‘card’ values from ‘deck’ that have values greater than 6 and that either has a suit equal to ‘hearts’ or a suit equal to ‘diamonds’.
# Verify that the length of the ‘red_gt6’vector is 16.

# We know we can use [] to select, & for AND and | for OR
# it is either a heart card with value greater than 6 OR a diamond card with value greater than 6
# do "deck$value > 6" two times before and after | ,or it could go wrong
red_gt6 <- deck[deck$value > 6 & deck$suit == "hearts"|deck$value > 6 & deck$suit == "diamonds", ]$card
# Verify the length is 16
length(red_gt6) == 16 #TRUE
# Yes, the length of the vector is 16

# Alternative way
# As a card is NOT spades AND NOT clubs, it is surely either hearts OR diamonds
# the value has to be greater than 6 AND suit must not be "spades" AND suit must not be "clubs"
red_gt6_alter <- deck[deck$value > 6 & deck$suit != "spades"& deck$suit != "clubs", ]$card
# Verify the length is 16
length(red_gt6_alter) == 16
# Yes, still 16

## Question 2 :
# Answer 2 :
# "allcards" would correspond to SAMPLE SPACE
# which is the set of all possible outcomes that could happen when drawing one card
# The three additional vectors would correspond to EVENTS
# they are subsets of the sample space because they each contains part of the cards from "allcards"
# each of them show all possible outcomes when getting a card which meets certain requirement(s)
# each of them contains all favorable outcomes when calculating probabilities

## task 9 :
# Given the length()of the vectors you have created in 5-8 above, calculate the following naïve probabilities
# a)Probability of not getting a heart when drawing one card

# length(nothearts): the length of vector which contains all possible outcomes to draw one card and the card is not a "heart"
# length(allcards): the length of vector which contains all possible outcomes when drawing one card
length(nothearts) / length(allcards)
# 0.75

# b)Probability of getting a card with a value less than 10 when drawing one card

# length(belowten): the length of vector which contains all possible outcomes to draw a card with a value less than 10
# length(allcards): the length of vector which contains all possible outcomes when drawing one card
length(belowten) / length(allcards)
# 0.6153846

# c)Probability of getting a heart when drawing one card

# Use complement
# 1 - the probability of not getting a heart when drawing one card
1 - length(nothearts) / length(allcards)
# 0.25

# d)Probability of not getting a heart when drawing two cards (with replacement)

# length(nothearts) / length(allcards): draw one time and not getting a heart
# With replacement, so do it exactly again (multiply)
(length(nothearts)  / length(allcards) )* (length(nothearts) / length(allcards))
# 0.5625

## task 10 :
# Use the in-built set operations on the vectors you created in Task 5-8 to create new vectors that are useful for calculating the following probabilities (when drawing one card)
# a)Probability of getting a card that is not a heart or has a value less than 10

# Use union() as you don't have to meet both requiremnets
# Create a new vector called "nH_or_bT" which contains every cards that is not a heart or has a value less than 10
nH_or_bT <- union(nothearts, belowten)
# Probability
length(nH_or_bT) / length(allcards)
# 0.9038462

# b)Probability of getting a card that is not a heart and has a value less than 10

# Use intersect() as both requirements have to be met
# Create a new vector called "nH_and_bT" which contains every card that is not a heart and has a value less than 10
nH_and_bT <- intersect(nothearts, belowten)
# Probability
length(nH_and_bT) / length(allcards)
# 0.4615385

# c)Given that the card is part of the ‘red_gt6’ subset, what is the probability that the card has a value less than 10 
# (i.e. a conditional probability)
# P(A|B) = P(A∩B) / P(B)
# Create a new vector called "RG6_and_bT" which contains every card that is part of the ‘red_gt6’ subset and has a value less than 10 
RG6_and_bT <- intersect(red_gt6,belowten)
# Probability
(length(RG6_and_bT) / length(allcards)) / (length(red_gt6) / length(allcards))
# 0.375

## task 11 :
# Write and expression that generates a random 5-card hand from the ‘allcards’ vector
# Run this a couple of times to verify that it generates 5-card hands.
# check that the content of ‘allcards’ doesn’t change between samples.

# Drawing 5 cards from allcards without replacement
sample(allcards, 5, replace = FALSE)
allcards
sample(allcards, 5, replace = FALSE)
length(allcards) == 52 #TRUE
sample(allcards, 5, replace = FALSE)
# "allcards" doesn't change

## task 12 :
# Create a function called “no_hearts_on_hand” that takes 2 vectors as arguments (inputs): a vector ‘five_cards’ with the cards obtained from the expression in Task 11, and the ‘nothearts’ vector you previously created. The function should return TRUE if the ‘five_cards’ contains no cards with the ‘hearts’ suit, and FALSE if there is at least one heart in the provided ‘five_cards’ vector.

# Create a vector called "five_cards" to store what we get after sampling
five_cards <- sample(allcards, 5, replace = FALSE)
# We want to know if all five cards are not "hearts" cards
# use %in% and "all()"
# We need "TRUE"  or "FALSE" to the question above to appear
# Put the answer in a vector called "the_logical_value"
# Then return(the_logical_value) to see the answer
no_hearts_on_hand <- function(five_cards, nothearts) {
   the_logical_value <- all(five_cards %in% nothearts)
   return(the_logical_value)
}
no_hearts_on_hand(five_cards, nothearts)
# FALSE

## task 13 :
# Given your function from Task 12 above and the nothearts vector you previously created, run the following code

N <- 100000
count <- 0
for (i in 1:N) {
  myhand <-sample(allcards, size=5, replace=FALSE)
  if (no_hearts_on_hand(myhand,nothearts)) {
    count <- count + 1
    }
}
count/N
# similar to 0.2215