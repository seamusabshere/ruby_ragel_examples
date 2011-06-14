
# line 1 "simple_tokenizer.rl"
=begin

# line 18 "simple_tokenizer.rl"

=end

# Scans a file for "STARTFOO[...]ENDFOO" blocks and outputs their contents.
#
# ENV['CHUNK_SIZE'] determines how much of the file to read in at a time, allowing you to control memory usage.
#
# Does not use ragel's scanner functionality because no backtracking is needed.
class SimpleTokenizer
  attr_reader :path

  def initialize(path)
    @path = path
    
# line 21 "simple_tokenizer.rb"
class << self
	attr_accessor :_simple_tokenizer_trans_keys
	private :_simple_tokenizer_trans_keys, :_simple_tokenizer_trans_keys=
end
self._simple_tokenizer_trans_keys = [
	83, 83, 83, 84, 65, 83, 
	82, 83, 83, 84, 70, 
	83, 79, 83, 79, 83, 
	83, 83, 69, 83, 69, 83, 
	68, 83, 69, 83, 69, 
	83, 69, 83, 69, 84, 
	65, 83, 69, 83, 69, 84, 
	69, 83, 69, 83, 69, 
	83, 69, 83, 0
]

class << self
	attr_accessor :_simple_tokenizer_key_spans
	private :_simple_tokenizer_key_spans, :_simple_tokenizer_key_spans=
end
self._simple_tokenizer_key_spans = [
	1, 2, 19, 2, 2, 14, 5, 5, 
	1, 15, 15, 16, 15, 15, 15, 16, 
	19, 15, 16, 15, 15, 15, 15
]

class << self
	attr_accessor :_simple_tokenizer_index_offsets
	private :_simple_tokenizer_index_offsets, :_simple_tokenizer_index_offsets=
end
self._simple_tokenizer_index_offsets = [
	0, 2, 5, 25, 28, 31, 46, 52, 
	58, 60, 76, 92, 109, 125, 141, 157, 
	174, 194, 210, 227, 243, 259, 275
]

class << self
	attr_accessor :_simple_tokenizer_indicies
	private :_simple_tokenizer_indicies, :_simple_tokenizer_indicies=
end
self._simple_tokenizer_indicies = [
	1, 0, 1, 2, 0, 3, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 1, 
	0, 4, 1, 0, 1, 5, 0, 6, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 1, 0, 7, 0, 
	0, 0, 1, 0, 8, 0, 0, 0, 
	1, 0, 10, 9, 12, 11, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 11, 
	11, 11, 13, 11, 12, 11, 11, 11, 
	11, 11, 11, 11, 11, 14, 11, 11, 
	11, 11, 13, 11, 15, 12, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 11, 
	11, 11, 11, 13, 11, 12, 16, 11, 
	11, 11, 11, 11, 11, 11, 11, 11, 
	11, 11, 11, 13, 11, 12, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 17, 
	11, 11, 11, 13, 11, 12, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 0, 
	11, 11, 11, 13, 11, 12, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 11, 
	11, 11, 11, 13, 18, 11, 19, 11, 
	11, 11, 12, 11, 11, 11, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 11, 
	13, 11, 12, 11, 11, 11, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 20, 
	13, 11, 12, 11, 11, 11, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 11, 
	13, 21, 11, 12, 22, 11, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 11, 
	11, 13, 11, 12, 11, 11, 11, 11, 
	11, 11, 11, 11, 11, 23, 11, 11, 
	11, 13, 11, 12, 11, 11, 11, 11, 
	11, 11, 11, 11, 11, 24, 11, 11, 
	11, 13, 11, 25, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 10, 9, 0
]

class << self
	attr_accessor :_simple_tokenizer_trans_targs
	private :_simple_tokenizer_trans_targs, :_simple_tokenizer_trans_targs=
end
self._simple_tokenizer_trans_targs = [
	0, 1, 2, 3, 4, 5, 6, 7, 
	8, 9, 15, 9, 10, 15, 11, 12, 
	13, 14, 16, 17, 18, 19, 20, 21, 
	22, 10
]

class << self
	attr_accessor :_simple_tokenizer_trans_actions
	private :_simple_tokenizer_trans_actions, :_simple_tokenizer_trans_actions=
end
self._simple_tokenizer_trans_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 1, 1, 0, 2, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 3
]

class << self
	attr_accessor :simple_tokenizer_start
end
self.simple_tokenizer_start = 0;
class << self
	attr_accessor :simple_tokenizer_first_final
end
self.simple_tokenizer_first_final = 0;
class << self
	attr_accessor :simple_tokenizer_error
end
self.simple_tokenizer_error = -1;

class << self
	attr_accessor :simple_tokenizer_en_main
end
self.simple_tokenizer_en_main = 0;


# line 32 "simple_tokenizer.rl"
    # % (this fixes syntax highlighting)
  end

  def emit(foo)
    $stdout.puts foo
  end

  def perform
    # So that ragel doesn't try to get it from data.length
    pe = :ignored
    eof = :ignored

    
# line 157 "simple_tokenizer.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = simple_tokenizer_start
end

# line 45 "simple_tokenizer.rl"
    # % (this fixes syntax highlighting)

    prefix = []
    ts = nil
    prefixing = false
    
    File.open(path) do |f|
      while chunk = f.read(ENV['CHUNK_SIZE'].to_i)
        data = prefix + chunk.unpack('c*')

        p = 0
        pe = data.length
        
# line 178 "simple_tokenizer.rb"
begin
	testEof = false
	_slen, _trans, _keys, _inds, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	end
	if _goto_level <= _resume
	_keys = cs << 1
	_inds = _simple_tokenizer_index_offsets[cs]
	_slen = _simple_tokenizer_key_spans[cs]
	_trans = if (   _slen > 0 && 
			_simple_tokenizer_trans_keys[_keys] <= data[p].ord && 
			data[p].ord <= _simple_tokenizer_trans_keys[_keys + 1] 
		    ) then
			_simple_tokenizer_indicies[ _inds + data[p].ord - _simple_tokenizer_trans_keys[_keys] ] 
		 else 
			_simple_tokenizer_indicies[ _inds + _slen ]
		 end
	cs = _simple_tokenizer_trans_targs[_trans]
	if _simple_tokenizer_trans_actions[_trans] != 0
	case _simple_tokenizer_trans_actions[_trans]
	when 1 then
# line 5 "simple_tokenizer.rl"
		begin

    # Since we're not in ragel's scanner mode, we'll define our own "ts" variable
    ts = p
  		end
	when 2 then
# line 9 "simple_tokenizer.rl"
		begin

    emit data[ts...p].pack('c*')
    ts = nil
    prefixing = false
  		end
	when 3 then
# line 5 "simple_tokenizer.rl"
		begin

    # Since we're not in ragel's scanner mode, we'll define our own "ts" variable
    ts = p
  		end
# line 9 "simple_tokenizer.rl"
		begin

    emit data[ts...p].pack('c*')
    ts = nil
    prefixing = false
  		end
# line 239 "simple_tokenizer.rb"
	end
	end
	end
	if _goto_level <= _again
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	end
	if _goto_level <= _out
		break
	end
end
	end

# line 58 "simple_tokenizer.rl"
        # % (this fixes syntax highlighting)

        if ts
          prefix = data[ts..-1]
          ts = 0
          prefixing = true
        elsif prefixing
          prefix = data
          prefixing = false
        else
          prefix = []
        end
      end
    end
  end
end

s = SimpleTokenizer.new ARGV[0]
s.perform
