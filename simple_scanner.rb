
# line 1 "simple_scanner.rl"
=begin

# line 16 "simple_scanner.rl"

=end
# Scans a file for "STARTFOO[...]ENDFOO" blocks and outputs their contents.
#
# ENV['CHUNK_SIZE'] determines how much of the file to read in at a time, allowing you to control memory usage.
#
# Uses ragel's scanner functionality even though it's not strictly necessary.
class SimpleScanner
  attr_reader :path

  def initialize(path)
    @path = path
    
# line 20 "simple_scanner.rb"
class << self
	attr_accessor :_simple_scanner_trans_keys
	private :_simple_scanner_trans_keys, :_simple_scanner_trans_keys=
end
self._simple_scanner_trans_keys = [
	65, 65, 82, 82, 84, 84, 
	70, 70, 79, 79, 79, 
	79, 0, 0, 69, 69, 
	69, 78, 68, 69, 69, 70, 
	69, 79, 69, 79, 83, 
	83, 84, 84, 0
]

class << self
	attr_accessor :_simple_scanner_key_spans
	private :_simple_scanner_key_spans, :_simple_scanner_key_spans=
end
self._simple_scanner_key_spans = [
	1, 1, 1, 1, 1, 1, 0, 1, 
	10, 2, 2, 11, 11, 1, 1
]

class << self
	attr_accessor :_simple_scanner_index_offsets
	private :_simple_scanner_index_offsets, :_simple_scanner_index_offsets=
end
self._simple_scanner_index_offsets = [
	0, 2, 4, 6, 8, 10, 12, 13, 
	15, 26, 29, 32, 44, 56, 58
]

class << self
	attr_accessor :_simple_scanner_indicies
	private :_simple_scanner_indicies, :_simple_scanner_indicies=
end
self._simple_scanner_indicies = [
	1, 0, 2, 0, 3, 0, 4, 0, 
	5, 0, 6, 0, 7, 8, 7, 8, 
	7, 7, 7, 7, 7, 7, 7, 7, 
	9, 7, 10, 8, 7, 8, 11, 7, 
	8, 7, 7, 7, 7, 7, 7, 7, 
	7, 7, 12, 7, 8, 7, 7, 7, 
	7, 7, 7, 7, 7, 7, 13, 7, 
	15, 14, 17, 16, 0
]

class << self
	attr_accessor :_simple_scanner_trans_targs
	private :_simple_scanner_trans_targs, :_simple_scanner_trans_targs=
end
self._simple_scanner_trans_targs = [
	13, 1, 2, 3, 4, 5, 6, 7, 
	8, 9, 10, 11, 12, 13, 13, 14, 
	13, 0
]

class << self
	attr_accessor :_simple_scanner_trans_actions
	private :_simple_scanner_trans_actions, :_simple_scanner_trans_actions=
end
self._simple_scanner_trans_actions = [
	1, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 2, 5, 6, 
	7, 0
]

class << self
	attr_accessor :_simple_scanner_to_state_actions
	private :_simple_scanner_to_state_actions, :_simple_scanner_to_state_actions=
end
self._simple_scanner_to_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 3, 0
]

class << self
	attr_accessor :_simple_scanner_from_state_actions
	private :_simple_scanner_from_state_actions, :_simple_scanner_from_state_actions=
end
self._simple_scanner_from_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 4, 0
]

class << self
	attr_accessor :_simple_scanner_eof_trans
	private :_simple_scanner_eof_trans, :_simple_scanner_eof_trans=
end
self._simple_scanner_eof_trans = [
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 0, 17
]

class << self
	attr_accessor :simple_scanner_start
end
self.simple_scanner_start = 13;
class << self
	attr_accessor :simple_scanner_first_final
end
self.simple_scanner_first_final = 13;
class << self
	attr_accessor :simple_scanner_error
end
self.simple_scanner_error = -1;

class << self
	attr_accessor :simple_scanner_en_main
end
self.simple_scanner_en_main = 13;


# line 29 "simple_scanner.rl"
    # % (this fixes syntax highlighting)
  end

  def emit(foo)
    $stdout.puts foo
  end

  def perform
    # So that ragel doesn't try to get it from data.length
    pe = :ignored
    eof = :ignored

    
# line 147 "simple_scanner.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = simple_scanner_start
	ts = nil
	te = nil
	act = 0
end

# line 42 "simple_scanner.rl"
    # % (this fixes syntax highlighting)

    prefix = []
    prefixing = false
    
    File.open(path) do |f|
      while chunk = f.read(ENV['CHUNK_SIZE'].to_i)
        data = prefix + chunk.unpack('c*')

        p = 0
        pe = data.length
        
# line 170 "simple_scanner.rb"
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
	case _simple_scanner_from_state_actions[cs] 
	when 4 then
# line 1 "NONE"
		begin
ts = p
		end
# line 194 "simple_scanner.rb"
	end
	_keys = cs << 1
	_inds = _simple_scanner_index_offsets[cs]
	_slen = _simple_scanner_key_spans[cs]
	_trans = if (   _slen > 0 && 
			_simple_scanner_trans_keys[_keys] <= data[p].ord && 
			data[p].ord <= _simple_scanner_trans_keys[_keys + 1] 
		    ) then
			_simple_scanner_indicies[ _inds + data[p].ord - _simple_scanner_trans_keys[_keys] ] 
		 else 
			_simple_scanner_indicies[ _inds + _slen ]
		 end
	end
	if _goto_level <= _eof_trans
	cs = _simple_scanner_trans_targs[_trans]
	if _simple_scanner_trans_actions[_trans] != 0
	case _simple_scanner_trans_actions[_trans]
	when 6 then
# line 1 "NONE"
		begin
te = p+1
		end
	when 2 then
# line 5 "simple_scanner.rl"
		begin
te = p+1
 begin 
    emit data[ts...te].pack('c*')[8..-7]
    prefixing = false
   end
		end
	when 5 then
# line 14 "simple_scanner.rl"
		begin
te = p+1
		end
	when 7 then
# line 14 "simple_scanner.rl"
		begin
te = p
p = p - 1;		end
	when 1 then
# line 14 "simple_scanner.rl"
		begin
 begin p = ((te))-1; end
		end
# line 241 "simple_scanner.rb"
	end
	end
	end
	if _goto_level <= _again
	case _simple_scanner_to_state_actions[cs] 
	when 3 then
# line 1 "NONE"
		begin
ts = nil;		end
# line 251 "simple_scanner.rb"
	end

	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	if _simple_scanner_eof_trans[cs] > 0
		_trans = _simple_scanner_eof_trans[cs] - 1;
		_goto_level = _eof_trans
		next;
	end
	end

	end
	if _goto_level <= _out
		break
	end
end
	end

# line 54 "simple_scanner.rl"
        # % (this fixes syntax highlighting)

        if ts
          prefix = data[ts..pe]
          te = te - ts if te
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

s = SimpleScanner.new ARGV[0]
s.perform
