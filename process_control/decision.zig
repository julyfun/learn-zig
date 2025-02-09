const val: anyerror!u32 = 0;
const expect = @import("std").testing.expect;

pub fn main() !void {
    if (val) |value| {
        try expect(value == 0);
    } else |err| {
        _ = err;
        unreachable;
    }
}
