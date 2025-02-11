const std = @import("std");
pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer {
        const deinit_status = gpa.deinit();
        if (deinit_status == .leak) @panic("TEST FAIL") else std.debug.print("ok", .{});
    }
    const bytes = try allocator.alloc(u8, 100);
    defer allocator.free(bytes);
}
