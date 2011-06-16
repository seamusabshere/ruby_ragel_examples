require 'test/unit'
require 'benchmark'

REFERENCE = File.read('test/support/foo_tokens.txt').chomp

class TestRagel < Test::Unit::TestCase
  def test_000_compile
    out_path = __method__.to_s + '.out'
    assert system("ragel -R lib/simple_tokenizer.rl")
    assert system("CHUNK_SIZE=100 ruby lib/simple_tokenizer.rb test/support/foo.txt > #{out_path}")
    assert_equal REFERENCE, File.read(out_path).chomp

    out_path = __method__.to_s + '.out'
    assert system("ragel -R lib/simple_scanner.rl")
    assert system("CHUNK_SIZE=100 ruby lib/simple_scanner.rb test/support/foo.txt > #{out_path}")
    assert_equal REFERENCE, File.read(out_path).chomp
  end
  
  def test_001_simple_tokenizer_tiny_chunk_size
    assert_correct_for_chunk_size 'simple_tokenizer.rl', 1
  end

  def test_002_simple_tokenizer_midsize_chunk_size
    assert_correct_for_chunk_size 'simple_tokenizer.rl', 3
  end
  
  def test_003_simple_tokenizer_huge_chunk_size
    assert_correct_for_chunk_size 'simple_tokenizer.rl', 1_000_000
  end
  
  def test_004_simple_scanner_tiny_chunk_size
    assert_correct_for_chunk_size 'simple_scanner.rl', 1
  end
  
  def test_005_simple_scanner_midsize_chunk_size
    assert_correct_for_chunk_size 'simple_scanner.rl', 3
  end

  def test_006_simple_scanner_huge_chunk_size
    assert_correct_for_chunk_size 'simple_scanner.rl', 1_000_000
  end
  
  private
  
  def assert_correct_for_chunk_size(rl_filename, chunk_size)
    test_name = /`(.*)'/.match(caller[0]).captures.first
    out_path = test_name + '.out'
    %w{ T0 T1 F1 G2 }.each do |code_style|
      unless `ragel -#{code_style} -R lib/#{rl_filename}` =~ /Invalid/
        realtime = Benchmark.realtime {
          `CHUNK_SIZE=#{chunk_size} ruby lib/#{rl_filename.sub('.rl', '.rb')} test/support/foo.txt > #{out_path}`
        }
        assert_equal REFERENCE, File.read(out_path).chomp
        if ENV['BENCHMARK'] == 'true'
          $stderr.puts "Benchmarking rl_filename=#{rl_filename} chunk_size=#{chunk_size} code_style=#{code_style}: #{realtime}s"
        end
      end
    end
  end
end
