const std = @import("std");
const expect = std.testing.expect;
const FileOpenError = error{
    AccessDenied,
    OutOfMemory,
    FileNotFoundError,
};

const AllocationError = error{OutOfMemory};

test "err" {
    const err = foo(AllocationError.OutOfMemory);
    if (err == FileOpenError.OutOfMemory) {
        std.debug.print("Out of memory. {d}\n", .{@intFromError(err)});
        try expect(err == error.OutOfMemory);
    }
}

fn foo(err: AllocationError) FileOpenError {
    return err;
}

fn deferErrorCaptureExample() !void {
    errdefer |err| {
        std.debug.print("the error is {s}\n", .{@errorName(err)});
    }
    return error.DeferError;
}

test "deferErrorCaptureExample" {
    deferErrorCaptureExample() catch {};
}
