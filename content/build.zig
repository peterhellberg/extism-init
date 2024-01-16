const std = @import("std");

pub fn build(b: *std.Build) void {
    const exe = b.addExecutable(.{
        .name = "extism-plugin",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = b.standardTargetOptions(.{
            .default_target = .{
                .abi = .musl,
                .os_tag = .freestanding,
                .cpu_arch = .wasm32,
            },
        }),
        .optimize = .ReleaseSmall,
    });

    exe.rdynamic = true;
    exe.entry = .disabled;

    const extism = b.dependency("extism", .{}).module("extism-pdk");

    exe.root_module.addImport("extism", extism);

    b.installArtifact(exe);
}
