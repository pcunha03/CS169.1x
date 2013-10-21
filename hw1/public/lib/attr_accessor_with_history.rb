class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    
    class_eval %Q{
      def #{attr_name}=(value)
        if !defined? @#{attr_name}_history
          @#{attr_name}_history = [nil]
        else
          @#{attr_name}_history << @#{attr_name}
        end
        @#{attr_name} = value
      end
    }
  end
end

# Testing for 'attr_accessor_with_history'
class Foo 
  attr_accessor_with_history :bar
end

f = Foo.new        
f.bar = 3          # => 3
f.bar = :wowzo     # => :wowzo
f.bar = 'boo!'     # => 'boo!'
f.bar_history      # => [nil, 3, :wowzo]

f = Foo.new
f.bar = 1 ; f.bar = 2
g = Foo.new
g.bar = 3 ; g.bar = 4
g.bar_history
