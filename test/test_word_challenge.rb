
require_relative './minitest_helper.rb'
require_relative '../word_challenge_processor.rb'
require 'pry'

class TestWordChallenge < MiniTest::Test

  def test_case_1
    input_file_name = 'test_dictionary.txt'
    expected_output = {
      'carr' => 'carrots',
      'give' => 'give',
      'rots' => 'carrots',
      'rows' => 'arrows',
      'rrot' => 'carrots',
      'rrow' => 'arrows'
    }
    output = process_word_challenge input_file_name
    assert_equal expected_output, output
  end

end
