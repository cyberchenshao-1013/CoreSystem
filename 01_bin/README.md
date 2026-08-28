# 01_bin

`01_bin/` is the system-level command and executable script directory, primarily intended for command-line driven automation and control.

## Structure

- `01_sys_control/`: low-level system control scripts for power, sleep, lock, screenshot, and network proxy toggles.
- `02_cli_tools/`: custom CLI tools for file synchronization, cross-device clipboard operations, quick actions, and system administration.
- `03_hooks/`: system hooks for validation, automation checks, and security policies before and after tool execution.

## Goal

Provide a unified execution layer so local system operations and automation workflows can be invoked, composed, and extended from the command line.
