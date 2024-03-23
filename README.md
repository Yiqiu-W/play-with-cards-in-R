#### play-with-cards-in-R
##### a simple practice of playing with cards' labels and suits &amp; odds in R with only basic operation and functions

##### expand.grid(), paste(),rep(),head(),length(),union(),intersect(), sample() etc.
#### Tasks:
##### 1. Use expand.grid() to create a data frame called ‘deck’ containing the two columns/variables ‘label’ and ‘suit’.The first column (‘label’) should be populated with the values from the vector ‘labels’ above, and the second column (‘suit’) should be populated with the values from the ‘suits’ column. Use the argument stringsAsFactors=FALSE so that the supplied vectors are stored as vectors of character strings (instead of factors) in the data frame
#
##### 2. Add a new column ‘card’ to the deck dataframe ‘deck’ that contains the paired values from columns ‘label’ and ‘suit’, separated by an underscore and make sure it contains character strings such as “2_hearts”, “3_hearts”, “ 8_clubs”, “Q_diamonds” etc
#
##### 3. Create a new column ‘value’ in the ‘deck’ dataframe and populate it with a vector that contains the correct card values for each of the 52 cards
#
##### 4. Use head() to show the first 15 lines in your data frame
#
##### 5. Create a vector ‘allcards’ containing all the character strings in the ‘card’ column from the ‘deck’ data frame(i.e. without any filtering)
#
##### 6. create a vector ‘nothearts’ containing the character strings from the ‘card’ column in ‘deck’ that don’t belong to the suit‘hearts’. Verify that the length of this vector is 39.
#
##### 7. Similar to task 6, create a vector of ‘card’ values from ‘deck’ where the ‘value’ of the card is less (<) than 10, and name this vector in a suitable way. Verify that its length is 32.
#
##### 8. Create a character string vector called ‘red_gt6’ with ‘card’ values from ‘deck’ that have values greater than 6 and that either has a suit equal to ‘hearts’ or a suit equal to ‘diamonds’. Verify that the length of the ‘red_gt6’vector is 16.
#
##### 9. Given the length()of the vectors you have created in 5-8 above, calculate the following naïve probabilities:
##### (a)Probability of not getting a heart when drawing one card 
##### (b)Probability of getting a card with a value less than 10 when drawing one card 
##### (c)Probability of getting a heart when drawing one card 
##### (d)Probability of not getting a heart when drawing two cards (with replacement)
#
##### 10. Use the in-built set operations on the vectors you created in Task 5-8 to create new vectors that are useful for calculating the following probabilities (when drawing one card):
##### (a)Probability of getting a card that is not a heart or has a value less than 10.
##### (b)Probability of getting a card that is not a heart and has a value less than 10.
##### (c)Given that the card is part of the ‘red_gt6’ subset, what is the probability that the card has a value less than 10.
