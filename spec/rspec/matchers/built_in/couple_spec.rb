shared_examples_for "output_to_stream" do |stream_name|
  matcher_method = :"output_to_#{stream_name}"

  define_method :matcher do |*args|
    send(matcher_method, *args)
  end

  context "expect { ... }.to #{matcher_method} (with no arg)" do
    it "passes if the block prints to #{stream_name}" do
      expect { stream.puts 'foo' }.to matcher
    end

    it "fails if the block does not print to #{stream_name}" do
      expect {
        expect { }.to matcher
      }.to fail_with("expected block to output to #{stream_name}, but did not")
    end
  end

  context "expect { ... }.not_to #{matcher_method} (with no arg)" do
    it "passes if the block does not print to #{stream_name}" do
      expect { }.not_to matcher
    end

    it "fails if the block prints to #{stream_name}" do
      expect {
        expect { stream.puts 'foo' }.not_to matcher
      }.to fail_with("expected block to output to #{stream_name}, but did not")
    end
  end

  context "expect { ... }.to #{matcher_method}('string')" do
    it "passes if the block prints that string to #{stream_name}" do
      expect { stream.puts 'foo' }.to matcher('foo')
    end

    it "fails if the block does not print to #{stream_name}" do
      expect {
        expect { }.to matcher('foo')
      }.to fail_with('expected block to output "foo" to #{stream_name}, but output nothing')
    end

    it "fails if the block prints a different string to #{stream_name}" do
      expect {
        expect { stream.puts 'food' }.to matcher('foo')
      }.to fail_with('expected block to output "foo" to #{stream_name}, but output "food"')
    end
  end
end

