$bar = 0
def foo
  $bar += 1
  2
end

RSpec.describe do
  it do
    $bar=0
    expect { foo }
      .to change { $bar }.to(1)
      .and return_value(2)
  end

  it do
    $bar=0
    expect { foo }
      .to return_value(satisfy{ |x| x == 2 })
      .and change { $bar }.to(1)
  end
end
