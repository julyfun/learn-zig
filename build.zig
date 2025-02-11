const std = @import("std");
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardOptimizeOption(.{});
    const exe = b.addExecutable(.{
        .name = "run",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = mode,
    });
    // 添加到顶级 install step 中，作为依赖
    b.installArtifact(exe);

    const run_exe = b.addRunArtifact(exe);
    run_exe.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_exe.addArgs(args);
    }
    const run_step = b.step("run", "Run it");
    run_step.dependOn(&run_exe.step);
}
