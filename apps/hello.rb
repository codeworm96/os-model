x = 0
(0..9).each {
    b = sys_read()
    x = x * 2 + b
}
sys_write("x = %010bb" % x)
