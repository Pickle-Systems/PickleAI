const std = @import("std");

const TaskState = enum { queued, observing, planned, executing, verifying, recovering, completed, failed };

const Task = struct {
    id: []const u8,
    goal: []const u8,
    state: TaskState,
};

const PlanStep = struct { name: []const u8, state: []const u8 };

fn emitStatus(state: []const u8) void {
    std.debug.print("{{\"type\":\"status\",\"engine\":\"zig\",\"state\":\"{s}\",\"recovery\":true,\"memory\":\"host-managed\"}}\n", .{state});
}

fn emitPlan(task_id: []const u8) void {
    const steps = [_]PlanStep{
        .{ .name = "observe", .state = "ready" },
        .{ .name = "plan", .state = "ready" },
        .{ .name = "execute", .state = "ready" },
        .{ .name = "verify", .state = "ready" },
        .{ .name = "recover", .state = "available" },
    };
    std.debug.print("{{\"type\":\"plan\",\"task_id\":\"{s}\",\"steps\":[", .{task_id});
    for (steps, 0..) |step, index| {
        if (index != 0) std.debug.print(",", .{});
        std.debug.print("{{\"name\":\"{s}\",\"state\":\"{s}\"}}", .{ step.name, step.state });
    }
    std.debug.print("]}}\n", .{});
}

fn processLine(line: []const u8) bool {
    const trimmed = std.mem.trim(u8, line, " \t\r\n");
    if (trimmed.len == 0) return true;

    if (std.mem.eql(u8, trimmed, "quit") or std.mem.eql(u8, trimmed, "exit")) {
        std.debug.print("{{\"type\":\"shutdown\"}}\n", .{});
        return false;
    }
    if (std.mem.eql(u8, trimmed, "help")) {
        std.debug.print("{{\"type\":\"help\",\"commands\":[\"status\",\"plan\",\"task\",\"verify\",\"recover\",\"quit\"]}}\n", .{});
        return true;
    }
    if (std.mem.eql(u8, trimmed, "status")) {
        emitStatus("ready");
        return true;
    }
    if (std.mem.eql(u8, trimmed, "plan")) {
        emitPlan("demo-task");
        return true;
    }
    if (std.mem.startsWith(u8, trimmed, "task ")) {
        const goal = std.mem.trim(u8, trimmed[5..], " \t");
        if (goal.len == 0) {
            std.debug.print("{{\"type\":\"error\",\"message\":\"task goal is empty\"}}\n", .{});
        } else {
            emitStatus("observing");
            emitPlan("task-001");
            std.debug.print("{{\"type\":\"task\",\"task_id\":\"task-001\",\"goal\":\"{s}\",\"state\":\"planned\"}}\n", .{goal});
        }
        return true;
    }
    if (std.mem.startsWith(u8, trimmed, "verify ")) {
        const task_id = std.mem.trim(u8, trimmed[7..], " \t");
        std.debug.print("{{\"type\":\"verification\",\"task_id\":\"{s}\",\"result\":\"pending-host-check\"}}\n", .{task_id});
        return true;
    }
    if (std.mem.startsWith(u8, trimmed, "recover ")) {
        const task_id = std.mem.trim(u8, trimmed[8..], " \t");
        emitStatus("recovering");
        std.debug.print("{{\"type\":\"recovery\",\"task_id\":\"{s}\",\"action\":\"retry-or-escalate\"}}\n", .{task_id});
        return true;
    }

    std.debug.print("{{\"type\":\"error\",\"message\":\"unknown command\"}}\n", .{});
    return true;
}

pub fn main() !void {
    const stdin = std.io.getStdIn().reader();
    var buffer: [8192]u8 = undefined;
    emitStatus("ready");
    while (true) {
        const line = (try stdin.readUntilDelimiterOrEof(&buffer, '\n')) orelse break;
        if (!processLine(line)) break;
    }
}
