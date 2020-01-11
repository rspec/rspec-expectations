module RSpec
  module Matchers
    module DSL27
      def method_missing(method, *args, **kwargs, &block)
        if @matcher_execution_context.respond_to?(method)
          @matcher_execution_context.__send__ method, *args, **kwargs, &block
        else
          super(method, *args, **kwargs, &block)
        end
      end
    end
  end
end
