module TweetsHelper

#don't need @ symbols because the tweet is an argumnet in the function
	def get_tagged(tweet)
		    message_arr = tweet.message.split
    #split message into an array, check for hashtag
    message_arr.each_with_index do |word, index|
      if word[0] == "#"
        #looks at whether that phrase is in the array
        if Tag.pluck(:phrase).include?(word)
          #if so, find the phrase
          tag = Tag.find_by(phrase: word)
          #if not, create a new tag
        else
          tag = Tag.create(phrase: word)
        end
        #create a tweet tag - fill in the attributes for the foreign keys
        TweetTag.create(tweet_id: tweet.id, tag_id: tag.id)
        #change hashtag string to hashtag link
        message_arr[index] = "<a href='/tag_tweets?id=#{tag.id}'>#{word}</a>"
      end
      #update the tweet with the message we created (joined back into a string)
    end
      tweet.update(message: message_arr.join(" "))
    
	end
end
