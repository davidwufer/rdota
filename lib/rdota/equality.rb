module Rdota
  module Equality

    def self.included(parent)
      class << parent
        def compare_equality_using_instance_variables
          compare_equality_using(instance_variables)
        end

        def compare_equality_using(*args)
          variables_as_strings = args.flatten.map { |arg| "@#{arg.to_s}" }
          establish_equality_between(variables_as_strings)
        end

        private
          def establish_equality_between(args)
            alias_method :eql?, :==

            define_method(:==) do |object|
              self.class == object.class && attr = object.attr
            end

            define_method(:hash) do
              attr.hash
            end

            define_method(:attr) do
              args.map { |arg| instance_variable_get(arg) }
            end
          end
      end
    end
  end
end
