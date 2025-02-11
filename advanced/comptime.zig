fn fib(i: i32) i32 {
    return if (i == 1 or i == 2) blk: {
        break :blk 1;
    } else fib(i - 1) + fib(i - 2);
}

test "comptime" {
    const std = @import("std");
    const expect = std.testing.expect;
    try expect(fib(8) == 21);
    try comptime expect(fib(8) == 21);
}

const comp_int = blk: {
    @setEvalBranchQuota(20000);
    break :blk fib(20); // found 1a6d in `objdump -d` only if fib(20)
};

pub fn main() !void {
    const a: i32 = comp_int;
    _ = a;
    const std = @import("std");
    std.debug.print("{d}", .{comp_int});
}
