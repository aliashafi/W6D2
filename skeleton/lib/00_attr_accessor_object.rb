class AttrAccessorObject


  def self.my_attr_accessor(*names)
    p names

    names.each do |name|

      define_method(name) do 
        instance_variable_get("@#{name}")
      end

      define_method( "#{name}=") { |value| 
        instance_variable_set("@#{name}", value)
      }
      end




  



  end


end
