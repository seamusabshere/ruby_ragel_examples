require 'test/unit'
require 'benchmark'

REFERENCE = File.read('test/support/foo_tokens.txt').chomp

class TestRagel < Test::Unit::TestCase
  def test_000_simple_tokenizer
    out_path = __method__.to_s + '.out.txt'
    assert system("ragel -R lib/simple_tokenizer.rl")
    assert system("CHUNK_SIZE=100 ruby lib/simple_tokenizer.rb test/support/foo.txt > #{out_path}")
    assert_equal REFERENCE, File.read(out_path).chomp
  end
  
  def test_001_simple_scanner
    out_path = __method__.to_s + '.out.txt'
    assert system("ragel -R lib/simple_scanner.rl")
    assert system("CHUNK_SIZE=100 ruby lib/simple_scanner.rb test/support/foo.txt > #{out_path}")
    assert_equal REFERENCE, File.read(out_path).chomp
  end
  
  def test_002_xml_tokenizer
    out_path = __method__.to_s + '.out.txt'
    assert system("ragel -R lib/xml_tokenizer.rl")
    assert system("CHUNK_SIZE=100 ruby lib/xml_tokenizer.rb test/support/foo.xml > #{out_path}")
    assert_equal REFERENCE, File.read(out_path).chomp    
  end
  
  i = 2
  {
    'simple_tokenizer.rl' => 'foo.txt',
    'simple_scanner.rl' => 'foo.txt',
    'xml_tokenizer.rl' => 'foo.xml',
  }.each do |rl_filename, input_filename|
    [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 100, 1_000_000 ].reverse.each do |chunk_size|
      i += 1
      eval %{
        def test_#{'%0.3d' % i}_#{File.basename(rl_filename, '.rl')}_chunk_size_#{chunk_size}
          assert_correct_for_chunk_size '#{rl_filename}', '#{input_filename}', #{chunk_size}
        end
      }
    end
  end
  
  private
  
  def assert_correct_for_chunk_size(rl_filename, input_filename, chunk_size)
    test_name = /`(.*)'/.match(caller[0]).captures.first
    out_path = test_name + '.out.txt'
    %w{ F1 }.each do |code_style|
      unless `ragel -#{code_style} -R lib/#{rl_filename}` =~ /Invalid/
        realtime = Benchmark.realtime {
          system "CHUNK_SIZE=#{chunk_size} ruby lib/#{rl_filename.sub('.rl', '.rb')} test/support/#{input_filename} > #{out_path}"
        }
        assert_equal REFERENCE, File.read(out_path).chomp
        File.unlink out_path
        if ENV['BENCHMARK'] == 'true'
          $stderr.puts "Benchmarking rl_filename=#{rl_filename} chunk_size=#{chunk_size} code_style=#{code_style}: #{realtime}s"
        end
      end
    end
  end
end
