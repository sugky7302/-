local function TryCatchTest()
    local try_catch = require 'try_catch'
    
    try_catch{
        function(i)
            -- error("error message")
            print "gogo"
        end,
        
        function(error)
            print(error)
        end
    }
end

return TryCatchTest