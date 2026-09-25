"""Small Python compatibility bridge for the PickleAI Zig core.

The bridge keeps the existing Python application in charge of UI, tools, and
local model integration while the Zig process owns the deterministic agent
lifecycle protocol.
"""

from __future__ import annotations

import json
import subprocess
from pathlib import Path
from typing import Any, Iterator


class ZigCore:
    def __init__(self, executable: str | Path) -> None:
        self.executable = str(executable)
        self.process = subprocess.Popen(
            [self.executable],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            bufsize=1,
        )

    def send(self, command: str) -> Iterator[dict[str, Any]]:
        if self.process.stdin is None or self.process.stdout is None:
            raise RuntimeError("Zig core pipes are unavailable")
        self.process.stdin.write(command.rstrip("\n") + "\n")
        self.process.stdin.flush()
        # The current core emits a bounded response sequence for each command.
        # Consumers can stop after receiving the event they need.
        for line in self.process.stdout:
            line = line.strip()
            if not line:
                continue
            try:
                yield json.loads(line)
            except json.JSONDecodeError:
                continue
            if 'type' in line and any(token in line for token in ('status', 'plan', 'task', 'verification', 'recovery', 'error')):
                break

    def close(self) -> None:
        if self.process.poll() is None:
            if self.process.stdin is not None:
                self.process.stdin.write("quit\n")
                self.process.stdin.flush()
            self.process.terminate()


__all__ = ["ZigCore"]
