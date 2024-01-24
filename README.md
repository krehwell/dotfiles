# Distraction-Free Dotfiles

Try to be minimalist possible

![Vim Full Split](https://i.imgur.com/0YSLWm2.png)

## Mac `defaults write` overrides:

1. Close Finder using command+q

```bash
defaults write com.apple.finder QuitMenuItem -bool YES && killall Finder
```

2. Disable popup showing accented characters when holding down a key

```bash
defaults write -g ApplePressAndHoldEnabled -bool false # pass true to enable it
```

3. Faster keyrepeat

```bash
defaults write -g InitialKeyRepeat -int 10 # default is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # default is 2 (30 ms)
```

4. "Show Hidden" by Defaullt

```bash
defaults write com.apple.finder AppleShowAllFiles -bool YES
killall Finder
```
