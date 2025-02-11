const std = @import("std");
const expect = std.testing.expect;
test "ok" {
    var foo: ?i32 = null;
    foo = 100;
    try comptime expect(@typeInfo(@TypeOf(foo)).optional.child == i32);
    comptime {
        try expect(@typeInfo(@TypeOf(foo)).optional.child == i32);
    }
}
