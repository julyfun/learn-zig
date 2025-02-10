const std = @import("std");
const print = std.debug.print;

test "defer" {
    defer print("3\n", .{});
    defer {
        print("1\n", .{});
    }
}
