const std = @import("std");
const extism = @import("extism");

const allocator = std.heap.wasm_allocator;

export fn greet() i32 {
    const plugin = extism.Plugin.init(allocator);
    const name = plugin.getInput() catch unreachable;
    defer allocator.free(name);

    const output = std.fmt.allocPrint(allocator, "Hello, {s}!\n", .{
        name,
    }) catch unreachable;

    plugin.output(output);

    return 0;
}
