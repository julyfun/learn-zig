pub fn main() !void {
    const items = [_]i32{ 1, 2, 3, 4, 6 };
    var sum: i32 = 0;
    for (items) |item| {
        if (@rem(item, 2) == 0) {
            continue;
        }
        sum += item;
    }
    const print = @import("std").debug.print;
    print("{d}\n", .{sum});
}

test "loop" {
    const print = @import("std").debug.print;
    inline for (0..5) |i| {
        print("i = {}\n", .{i});
    }
}

fn rangeHasNumber(begin: usize, end: usize, number: usize) bool {
    var i = begin;
    return while (i < end) : (i += 1) {
        if (i == number) {
            break true;
        }
    } else false;
}

test "rangeHasNumber" {
    const std = @import("std");
    const assert = std.debug.assert;
    assert(rangeHasNumber(0, 5, 3) == true);
    assert(rangeHasNumber(0, 5, 5) == false);
}
