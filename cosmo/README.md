# PickleOS / Cosmopolitan foundation

This directory contains the first foundation for a unified PickleAI runtime.

## Intended behavior

- When launched from Windows or Linux, `PickleAI.com` behaves as a normal PickleAI application.
- When booted through a supported Cosmopolitan BIOS path, the same artifact can enter a minimal PickleOS runtime.
- Agent logic, memory, tools, and model services should be shared wherever the runtime permits.

## Architecture

```text
PickleAI core
├── host runtime       Windows/Linux/macOS application integration
├── boot runtime       BIOS/UEFI-compatible minimal environment
├── agent services     planning, execution, verification, recovery
├── memory services    local state and task history
└── model runtime      platform-specific inference backend
```

## Current status

The C launcher is a host-shell foundation. It is deliberately small and does not yet claim to be a complete operating system or to execute the existing Python/WebView2 interface in BIOS mode.

The next stages are:

1. Build the launcher as a genuine Cosmopolitan APE.
2. Define a stable protocol between the launcher and the shared Zig agent core.
3. Add a host runtime that starts the existing PickleAI interface.
4. Add a boot runtime with console output, keyboard input, memory management, and storage access.
5. Add a lightweight model backend appropriate for the boot environment.
6. Add a bootable disk-image test target before attempting real hardware.

## Safety and recovery

The boot runtime should initially be read-only and testable in a virtual machine. It should not modify disks, firmware, boot entries, or partitions without an explicit user-controlled installer step.
