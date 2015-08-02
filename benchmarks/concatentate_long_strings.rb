require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('concat with backslash      ') do
    "something" \
      "something"
  end
  x.report('concat with plus           ') do
    "something" +
      "something"
  end
  x.report('concat with shovel operator') do
    "something" <<
    "something"
  end
  x.compare!
end

__END__
Ruby 2.1.6

Calculating -------------------------------------
concat with backslash
                       101.398k i/100ms
concat with plus
                        86.058k i/100ms
concat with shovel operator
                        86.550k i/100ms
-------------------------------------------------
concat with backslash
                          5.065M (±12.7%) i/s -     24.944M
concat with plus
                          2.614M (±10.7%) i/s -     12.995M
concat with shovel operator
                          2.674M (±10.6%) i/s -     13.242M

Comparison:
concat with backslash      :  5064874.6 i/s
concat with shovel operator:  2674309.7 i/s - 1.89x slower
concat with plus           :  2613889.7 i/s - 1.94x slower
