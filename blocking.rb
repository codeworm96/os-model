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

class BlockingOS < OS
    Process = Struct.new(:proc, :args)

    def run(init)
        init_proc = Proc.new {
            instance_eval(init)
        }
        @procs = [Process.new(init_proc, [])]
        while !@procs.empty?
            ix = Random.rand(@procs.length)
            current = @procs.delete_at(ix)
            current.proc.call(*current.args)
        end
    end

    def sys_read()
        Random.rand(2)
    end

    def sys_write(s)
        @buf += s
    end

    def sys_spawn(*args, &proc)
        @procs.append(Process.new(proc, args))
    end
end
