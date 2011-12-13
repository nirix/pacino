helpers do
  ##
  # Gets the time difference in words
  #
  # @copyright abdelm and YorickPeterse
  # @url https://gist.github.com/1471370
  #
  def time_ago_in_words(timestamp, from_timestamp = nil)
    return if timestamp.nil?
    
    from_timestamp = Time.now.to_i if from_timestamp.nil?

    difference = from_timestamp.to_i - timestamp.to_i
    periods    = ['second', 'minute', 'hour', 'day', 'week', 'month', 'year', 'decade']
    lengths    = [60, 60, 24, 7, 4.35, 12, 10]

    i = 0
    while difference >= lengths[i]
      difference /= lengths[i]
      i += 1
    end

    difference = difference.ceil
    periods[i] = periods[i] +'s' if difference != 1

    return "#{difference} #{periods[i]} ago"
  end
end