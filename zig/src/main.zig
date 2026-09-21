const std = @import("std");

const Command = struct {
    name: []const u8,
    description: []const u8,
};

const commands = [_]Command{
    .{ .name = "status", .description = "Show the Zig core status" },
    .{ .name = "plan", .description = "Create a deterministic starter plan" },
    .{ .name = "help", .description = "List available commands" },
    .{ .name = "quit", .description = "Exit the core" },
};

fn printHelp() void {
    std.debug.print("PickleAI Zig Core\nCommands:\n", .{});
    for (commands) |command| {
        std.debug.print("  {s:<8} {s}\n", .{ command.name, command.description });
    }
}

fn handleCommand(input: []const u8) bool {
    const trimmed = std.mem.trim(u8, input, " \t\r\n");

    if (std.mem.eql(u8, trimmed, "quit") or std.mem.eql(u8, trimmed, "exit")) {
        std.debug.print("{{\"event\":\"shutdown\"}}\n", .{});
        return false;
    }

    if (std.mem.eql(u8, trimmed, "help")) {
        printHelp();
        return true;
    }

    if (std.mem.eql(u8, trimmed, "status")) {
        std.debug.print("{{\"event\":\"status\",\"engine\":\"zig\",\"phase\":\"bootstrap\",\"recovery\":true,\"memory\":\"planned\"}}\n", .{});
        return true;
    }

    if (std.mem.eql(u8, trimmed, "plan")) {
        std.debug.print("{{\"event\":\"plan\",\"steps\":[\"observe\",\"plan\",\"execute\",\"verify\",\"recover\"]}}\n", .{});
        return true;
    }

    if (trimmed.len != 0) {
        std.debug.print("{{\"event\":\"error\",\"message\":\"unknown command\"}}\n", .{});
    }
    return true;
}

pub fn main() !void {
    const stdin = std.io.getStdIn().reader();
    var buffer: [4096]u8 = undefined;

    std.debug.print("PickleAI Zig Core ready. Type 'help'.\n", .{});
    while (true) {
        const line = stdin.readUntilDelimiterOrEof(&buffer, '\n') orelse break;
        if (!handleCommand(line)) break;
    }
}
