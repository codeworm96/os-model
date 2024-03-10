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

    def sys_write()
    end
end

class BlockingOS < OS
    def run(init)
        instance_eval(init)
    end

    def sys_read()
        Random.rand(2)
    end

    def sys_write(s)
        @buf += s
    end
end
