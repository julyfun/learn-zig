const std = @import("std");
const print = std.debug.print;
test "switch" {
    const a: u64 = 10;
    const zz: u64 = 103;

    // 作为表达式使用
    const b = switch (a) {
        // 多匹配项
        1, 2, 3 => 0,

        // 范围匹配
        5...100 => 1,

        // tag形式的分配匹配，可以任意复杂
        101 => blk: {
            const c: u64 = 5;
            // 下一行代表返回到blk这个tag处
            break :blk c * 2 + 1;
        },

        zz => zz,
        // 支持编译期运算
        blk: {
            const d: u32 = 5;
            const e: u32 = 100;
            break :blk d + e;
        } => 107,

        // else 匹配剩余的分支
        else => 9,
    };
    print("{}\n", .{b});
}

test "switch os" {
    const builtin = @import("builtin");
    const os_msg = switch (builtin.target.os.tag) {
        .linux => "we found linux",
        else => "not a linux user",
    };
    print("{s}\n", .{os_msg});
}

test "for ..." {
    for (1..10) |i| {
        print("i = {}\n", .{i});
    }
}

fn isFieldOptional(comptime T: type, field_index: usize) anyerror!bool {
    const type_info = @typeInfo(T);
    return switch (type_info) {
        .@"struct" => |struct_info| {
            const fields = struct_info.fields;
            return switch (field_index) {
                inline 0...fields.len - 1 => |idx| {
                    return @typeInfo(fields[idx].type) == .optional;
                },
                else => return error.IndexOutOfBounds,
            };
        },
        else => return error.InvalidType,
    };
}

test "inline switch" {
    const A = struct {
        a: ?u32,
        b: u32,
    };
    const is_a_optional = isFieldOptional(A, 2) catch |err| blk: {
        print("error: {}\n", .{err});
        break :blk false;
    };
    print("is_a_optional = {}\n", .{is_a_optional});
}
