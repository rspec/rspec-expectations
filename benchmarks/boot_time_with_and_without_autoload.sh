echo "With autoloading"
time (for i in {1..50}; do ruby -I./lib:../rspec-support/lib:/Users/myron/.gem/ruby/1.9.3/gems/diff-lcs-1.2.5/lib --disable-gems -e "require 'rspec/expectations'"; done)

echo
echo "Without autoloading"
time (for i in {1..50}; do DISABLE_AUTOLOAD=1 ruby -I./lib:../rspec-support/lib:/Users/myron/.gem/ruby/1.9.3/gems/diff-lcs-1.2.5/lib --disable-gems -e "require 'rspec/expectations'"; done)

#With autoloading

#real  0m1.219s
#user  0m0.938s
#sys 0m0.239s

#Without autoloading

#real  0m1.772s
#user  0m1.402s
#sys 0m0.323s
