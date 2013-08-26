module SpecHelperMethods
  def expect_deprecation_with_call_site(file, line)
    expect(RSpec.configuration.reporter).to receive(:deprecation) do |options|
      expect(options[:call_site]).to include([file, line].join(':'))
    end
  end

  def allow_deprecation
    allow(RSpec.configuration.reporter).to receive(:deprecation)
  end
end
