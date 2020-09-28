# xps keys

I have a Dell XPS 13 7390 and the arrow keys are super close to the page up/down buttons. That makes it annoying when trying to use arrows when coding/typing. To resolve this I'm going to remove the page up/down keys and turn those into left and right (the arrow keys they are closest to).

This is what they look like:

++page-up arrow-up page-down++
++arrow-left arrow-down arrow-right++

## Finding keycodes/actions

`xev` will log the keycodes and actions for each key press in the terminal, for me these were:

| Key | Keycode | Action |
|-----|---------|--------|
| Right Arrow | 114 | Right |
| Left Arrow | 113 | Left |
| PgDn | 117 | Dont Care |
| PgUp | 112 | Dont Care |

## Changing Keys

- I want to change PgDn (117) to Right (Action)

```
xmodmap -e "keycode 117 = Right"
```

- I want to change PgDn (112) to Left (Action)

```
xmodmap -e "keycode 112 = Left"
```

## Startup

Create a startup script that makes the key mapping changes "permanent"

```
mkdir startup && cd startup/

touch keymap.sh
chmod +x keymap.sh
```

Add commands to script

```
xmodmap -e "keycode 117 = Right"
xmodmap -e "keycode 112 = Left"
```

Add script to startup by opening **startup applications**

- **Name** - Keymap
- **Command** - Browse to `~/startup/keymap.sh`
- **Comments** - map pgup to left and pgdn to right

Restart or Logout/Login to test

:trophy: