require './os'

class GeneratorOS < OS
    Process = Struct.new(:fiber, :retval)

    def run(init)
        init_fiber = Fiber.new do
            instance_eval(init)
        end
        @procs = [Process.new(init_fiber, nil)]
        while !@procs.empty?
            ix = Random.rand(@procs.length)
            current = @procs[ix]
            case current.fiber.resume(current.retval)
            in :sys_read
                current.retval = Random.rand(2)
            in [:sys_write, s]
                @buf += s
                current.retval = nil
            in [:sys_spawn, args, proc]
                fiber = ->(args) { Fiber.new { proc.call(*args) }}
                @procs.append(Process.new(fiber.call(args), nil))
                current.retval = nil
            else
                @procs.delete_at(ix)
            end
        end
    end

    def sys_read()
        Fiber.yield :sys_read
    end

    def sys_write(s)
        Fiber.yield :sys_write, s
    end

    def sys_spawn(*args, &proc)
        Fiber.yield :sys_spawn, args, proc
    end
end
