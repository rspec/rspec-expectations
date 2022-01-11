require 'diff-lcs'

Around "@skip-when-diff-lcs-1.4" do |scenario, block|
  if Diff::LCS::VERSION >= '1.4'
    skip_this_scenario "Skipping scenario #{scenario.name} on `diff-lcs` v#{Diff::LCS::VERSION}"
  else
    block.call
  end
end

Around "@skip-when-diff-lcs-1.4.3" do |scenario, block|
  if Diff::LCS::VERSION =~ /1\.4\.3/
    skip_this_scenario "Skipping scenario #{scenario.name} on `diff-lcs` v#{Diff::LCS::VERSION}"
  else
    block.call
  end
end

Around "@skip-when-diff-lcs-1.3" do |scenario, block|
  if Diff::LCS::VERSION < '1.4'
    skip_this_scenario "Skipping scenario #{scenario.name} on `diff-lcs` v#{Diff::LCS::VERSION}"
  else
    block.call
  end
end
