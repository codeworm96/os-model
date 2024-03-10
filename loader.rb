module Loader
    def self.load(filename)
        IO.read(filename)
    end
end