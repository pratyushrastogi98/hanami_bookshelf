module Bookshelf
  module Persistence
    module Entities
      class Book < ROM::Struct

        # 
        # convert the ROM::Struct object to json
        # 
        def json_format
          self.to_h.to_json
        end
          
      end
    end
  end
end
