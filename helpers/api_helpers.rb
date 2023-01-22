require 'oj'
module Apihelpers
    def inject_params
        jsonstr = request.body.read
        @json_params = Oj.load(jsonstr,symbol_keys:true)
    end    
end