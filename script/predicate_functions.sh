# This file was generated on 2020-11-29T14:01:16+03:00 from the rspec-dev repo.
# DO NOT modify it by hand as your changes will get lost the next time it is generated.

function is_mri {
  # RUBY_ENGINE only returns 'ruby' on MRI.
  if ruby -e "exit(RUBY_ENGINE == 'ruby')"; then
    return 0
  else
    return 1
  fi;
}

function is_jruby {
  # RUBY_PLATFORM only returns 'java' on JRuby.
  if ruby -e "exit(RUBY_PLATFORM == 'java')"; then
    return 0
  else
    return 1
  fi;
}

function is_ruby_25_plus {
  if ruby -e "exit(RUBY_VERSION.to_f >= 2.5)"; then
    return 0
  else
    return 1
  fi
}

function rspec_rails_compatible {
  if is_ruby_25_plus; then
    return 0
  else
    return 1
  fi
}

function additional_specs_available {
  type run_additional_specs > /dev/null 2>&1
  return $?
}

function documentation_enforced {
  if [ -x ./bin/yard ]; then
    if is_mri; then
      return 0
    else
      return 1
    fi
  else
    return 1
  fi
}

function style_and_lint_enforced {
 if [ -x ./bin/rubocop ]; then
   return 0
 else
   return 1
 fi
}
