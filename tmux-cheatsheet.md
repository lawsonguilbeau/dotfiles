# Tmux Cheat Sheet

## Prefix Key
- **Prefix**: `Ctrl-a` (instead of default `Ctrl-b`)

## Session Management
- `Ctrl-a C-s` - Choose session from list
- `Ctrl-a S` - Create new session (prompts for name)
- `Ctrl-a R` - Rename current session
- `Ctrl-a d` - Detach from session
- `tmux ls` - List all sessions (from terminal)
- `tmux attach -t <session-name>` - Attach to session

## Window Management
- `Ctrl-a c` - Create new window (opens in current directory)
- `Ctrl-a w` - Choose window from list
- `Ctrl-a W` - Choose session from list
- `Alt-H` - Previous window (no prefix needed)
- `Alt-L` - Next window (no prefix needed)
- `Ctrl-Alt-h` - Move window left
- `Ctrl-Alt-l` - Move window right
- `Ctrl-a ,` - Rename window
- `Ctrl-a &` - Kill window

## Pane Management
- `Ctrl-a |` - Split horizontally (opens in current directory)
- `Ctrl-a -` - Split vertically (opens in current directory)
- `Ctrl-h/j/k/l` - Navigate panes (no prefix needed)
- `Ctrl-a h/j/k/l` - Resize panes
- `Ctrl-a m` - Maximize/restore pane
- `Ctrl-a x` - Kill pane
- `Ctrl-a y` - Toggle pane synchronization

## Quick Layouts
- `Alt-1` - Even horizontal layout
- `Alt-2` - Even vertical layout
- `Alt-3` - Main horizontal layout
- `Alt-4` - Main vertical layout
- `Alt-5` - Tiled layout

## Copy Mode (Vim-style)
- `Ctrl-a [` - Enter copy mode
- `v` - Start selection
- `y` - Copy selection
- `Ctrl-a ]` - Paste
- `Ctrl-a /` - Search in copy mode
- `q` - Exit copy mode

## Search in Copy Mode
- `/` - Search forward
- `?` - Search backward
- `n` - Next search result
- `N` - Previous search result

## Configuration
- `Ctrl-a r` - Reload tmux config
- `Ctrl-a h` - Open quick notes (nvim)

## Enhanced Features
- **Base Index**: Windows and panes start at 1 (not 0)
- **Auto Renumber**: Windows automatically renumber when closed
- **History**: 50,000 lines of scrollback
- **Activity Monitoring**: Visual notification of activity in other windows
- **Auto Save**: Sessions auto-save every 15 minutes
- **Mouse Support**: Full mouse support enabled
- **Status Position**: Status bar at top

## Plugin Features (if installed)
- **tmux-resurrect**: Restore sessions after restart
- **tmux-continuum**: Auto-save sessions
- **vim-tmux-navigator**: Seamless navigation between vim and tmux
- **tmux-yank**: Better clipboard integration
- **tokyo-night**: Beautiful theme

## Tips
1. Use `Ctrl-h/j/k/l` for quick pane navigation without prefix
2. Use `Alt-H/L` for quick window switching
3. New windows/panes open in the current directory
4. Pane synchronization (`Ctrl-a y`) is great for running commands on multiple servers
5. The status bar is at the top and updates every 5 seconds

