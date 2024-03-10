require './loader'

class OS
    def initialize(filename)
        init = Loader.load(filename)
        @buf = ""
        run(init)
        puts @buf
    end

    def sys_read()
    end

    def sys_write(s)
    end

    def sys_spawn(*args, &proc)
    end
end
