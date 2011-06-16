=begin
%%{
  machine simple_tokenizer;

  action Keep {
    # Since we're not in ragel's scanner mode, we'll define our own "ts" variable
    ts = p
  }
  action Emit {
    emit data[ts...p].pack('c*')
    ts = nil
    prefixing = false
  }

  foo = '<Foo>' any+ >Keep %Emit :>> '</Foo>';

  main := ( any+ | foo )*;
}%%
=end

# Scans a file for "<Foo>[...]</Foo>" blocks and outputs their contents.
#
# ENV['CHUNK_SIZE'] determines how much of the file to read in at a time, allowing you to control memory usage.
#
# Does not use ragel's scanner functionality because no backtracking is needed.
class SimpleTokenizer
  attr_reader :path

  def initialize(path)
    @path = path
    %% write data;
    # % (this fixes syntax highlighting)
  end

  def emit(foo)
    $stdout.puts foo
  end

  def perform
    # So that ragel doesn't try to get it from data.length
    pe = :ignored
    eof = :ignored

    %% write init;
    # % (this fixes syntax highlighting)

    prefix = []
    ts = nil
    prefixing = false
    
    File.open(path) do |f|
      while chunk = f.read(ENV['CHUNK_SIZE'].to_i)
        data = prefix + chunk.unpack('c*')

        p = 0
        pe = data.length
        %% write exec;
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
