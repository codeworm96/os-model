def process(name)
    (0..4).each {
        sys_write(name)
    }
end

sys_spawn("A", &method(:process))
sys_spawn("B", &method(:process))
