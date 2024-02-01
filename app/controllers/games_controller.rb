require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = session[:letters] = ('A'..'Z').to_a.sample(10)
  end

  def score
    @word = params[:word].upcase
    @letters = session[:letters]
    @word_found = api(@word)
    @include_letters = include_letters(@word, @letters)
  end

  private

  def include_letters(word, letters)
    word_characters = word.chars
    word_characters.all? { |char| letters.include?(char) }
  end

  def api(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
