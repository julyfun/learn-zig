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
    for (0..5) |i| {
        print("i = {}\n", .{i});
    }
}
