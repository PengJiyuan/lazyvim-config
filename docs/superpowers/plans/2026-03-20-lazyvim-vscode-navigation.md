# LazyVim VS Code Navigation Parity Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make navigation in this LazyVim setup feel closer to VS Code while preserving LazyVim defaults and core plugins.

**Architecture:** Keep LazyVim’s existing plugin stack and implement navigation changes inside the existing user configuration surface. Prefer plugin-local `keys` and `opts` in `lua/plugins/frontend.lua`, and only use `lua/config/keymaps.lua` for truly global mappings that cannot live safely on a plugin spec.

**Tech Stack:** LazyVim, snacks.nvim, bufferline.nvim, trouble.nvim, Neovim Lua

---

## File Structure

- Modify: `lua/plugins/frontend.lua`
  - Extend `folke/snacks.nvim` options for explorer and picker behavior.
  - Add plugin-local `keys` for VS Code-like navigation entrypoints.
  - Add `trouble.nvim` and `bufferline.nvim` overrides only if needed for navigation visibility.
- Modify: `lua/config/keymaps.lua`
  - Only if a small number of truly global mappings are still needed after plugin-local keys are added.
- Validate: `nvim --headless '+qa'`
- Validate manually inside Neovim:
  - explorer reveal/sidebar behavior
  - recent files
  - open buffers list
  - document/workspace symbols
  - diagnostics/problems entrypoint

### Task 1: Enhance explorer behavior

**Files:**
- Modify: `lua/plugins/frontend.lua`
- Validate: interactive explorer behavior
- Validate: `nvim --headless '+qa'`

- [ ] **Step 1: Record the intended behavior**

Write down the exact behavior to preserve scope:
- keep `snacks.nvim` as the explorer
- keep `replace_netrw = true`
- show hidden files in explorer
- make the explorer act like a stable left sidebar entrypoint rather than a temporary file browser

- [ ] **Step 2: Inspect the existing `snacks.nvim` spec**

Confirm the current explorer and picker options in `lua/plugins/frontend.lua` so the change extends them instead of replacing LazyVim defaults broadly.

- [ ] **Step 3: Write minimal implementation**

Adjust only the `folke/snacks.nvim` section in `lua/plugins/frontend.lua` to improve sidebar navigation while preserving the existing plugin choice and current hidden/ignored file behavior.

- [ ] **Step 4: Validate startup**

Run: `nvim --headless '+qa'`
Expected: PASS with no startup errors.

- [ ] **Step 5: Validate behavior manually**

Open Neovim and confirm:
- explorer opens from the expected entrypoint
- hidden files are visible
- explorer feels stable and repeatable as a left-side workspace navigator

### Task 2: Add VS Code-like picker entrypoints

**Files:**
- Modify: `lua/plugins/frontend.lua`
- Validate: interactive picker behavior
- Validate: `nvim --headless '+qa'`

- [ ] **Step 1: Record the exact entrypoints to add**

Use these concrete targets so the outcome is consistent:
- find files
- recent files
- open buffers
- document symbols
- workspace symbols
- command palette

- [ ] **Step 2: Inspect current mappings before changing them**

Review existing mappings in `lua/plugins/frontend.lua` and `lua/config/keymaps.lua` to avoid overriding LazyVim defaults unless there is a clear VS Code-like benefit.

- [ ] **Step 3: Write minimal implementation**

Add plugin-local `keys` entries where possible so the navigation mappings live next to the `snacks.nvim` picker behavior. Keep shortcuts additive and memorable rather than replacing established LazyVim leader workflows.

- [ ] **Step 4: Validate startup**

Run: `nvim --headless '+qa'`
Expected: PASS with no startup errors.

- [ ] **Step 5: Validate behavior manually**

Open Neovim and confirm each new entrypoint works:
- files
- recent files
- buffers
- document symbols
- workspace symbols
- commands

### Task 3: Add a single Problems entrypoint and smoother buffer switching

**Files:**
- Modify: `lua/plugins/frontend.lua`
- Modify: `lua/config/keymaps.lua` only if a global mapping is still necessary after Task 2
- Validate: interactive problems/buffer workflow
- Validate: `nvim --headless '+qa'`

- [ ] **Step 1: Record the exact workflow to add**

Target this user-facing behavior:
- one memorable entrypoint for diagnostics/problems
- one clear picker/list for open buffers
- no plugin replacements if LazyVim already ships the needed UI

- [ ] **Step 2: Inspect existing `trouble.nvim` and buffer navigation defaults**

Confirm what LazyVim already provides so the change adds entrypoints instead of duplicating built-in behavior unnecessarily.

- [ ] **Step 3: Write minimal implementation**

Add only the smallest config needed to expose:
- a stable Problems entrypoint backed by `trouble.nvim` or the existing diagnostics UI
- a stable open-buffers entrypoint that complements Task 2

Prefer plugin-local mappings. Use `lua/config/keymaps.lua` only if a global mapping cannot be attached cleanly to the relevant plugin spec.

- [ ] **Step 4: Validate startup**

Run: `nvim --headless '+qa'`
Expected: PASS with no startup errors.

- [ ] **Step 5: Validate behavior manually**

Open Neovim and confirm:
- the Problems entrypoint opens diagnostics predictably
- switching between open files feels more like a VS Code workspace flow

### Task 4: Final verification and summary

**Files:**
- Modify: none unless minor fixes are required
- Validate: startup and interactive workflow

- [ ] **Step 1: Run startup verification**

Run: `nvim --headless '+qa'`
Expected: PASS with no output.

- [ ] **Step 2: Perform manual workflow verification**

Validate interactively:
- explorer works as the main sidebar navigator
- recent files works
- buffers list works
- document/workspace symbol pickers work
- Problems entrypoint works

- [ ] **Step 3: Summarize user-facing changes**

Prepare a short summary covering:
- what changed
- which shortcuts were added
- how the result stays close to LazyVim
