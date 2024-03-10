x = 0
(0..9).each do
    b = sys_read()
    x = x * 2 + b
end
sys_write("x = %010bb" % x)
