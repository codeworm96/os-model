def process(name)
    (0..4).each do
        sys_write(name)
    end
end

sys_spawn("A", &method(:process))
sys_spawn("B", &method(:process))
