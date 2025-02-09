const print = @import("std").debug.print;
pub fn main() !void {
    var integer: i32 = 42;
    const ptr = &integer;
    ptr.* = ptr.* + 1;
    print("{d}\n", .{integer});
}
