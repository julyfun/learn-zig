const std = @import("std");
const print = std.debug.print;
const me_zh = '我';

fn max(comptime T: type, a: T, b: T) T {
    if (a > b) return a;
    return b;
}

pub fn main() !void {
    const ele_4 = @Vector(4, i32);
    const a = ele_4{ 1, 2, 3, 4 };
    const b = ele_4{ 2, 2, 3, 4 };
    const c = a + b;
    print("{any}", .{c});
}
