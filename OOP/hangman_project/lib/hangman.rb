class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman::random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars 
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    return false if !@attempted_chars.include?(char)

    true
  end

  def get_matching_indices(matchingChar)
    indices = []

    @secret_word.each_char.with_index { |char, i| indices << i if matchingChar === char }

    indices
  end

  def fill_indices(char, indices)
    indices.each { |index| @guess_word[index] = char }
  end

  def try_guess(char)
    matching_indices = get_matching_indices(char)

    fill_indices(char, matching_indices)

    if already_attempted?(char)
      p "that has already been attempted"
      return false
    end 

    @remaining_incorrect_guesses -= 1 if matching_indices === []

    @attempted_chars << char

    true
  end

  def ask_user_for_guess
    p "Enter a char:"

    try_guess(gets.chomp)
  end

  def win?
    return false if @guess_word.join != @secret_word

    p "WIN"
    true
  end

  def lose?
    return false if @remaining_incorrect_guesses > 0

    p "LOSE"
    true
  end

  def game_over?
    return false if !(win? || lose?)

    p @secret_word

    true
  end

end
