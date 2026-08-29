# Distraction-Free Dotfiles

as less as I could

## Tools Deps: 

0. `neovim`
1. `fish`
2. `tmux`
3. `rmtrash`
4. `fzf` & `bat`
5. `alacritty` with `Consolas Nerd Font Mono`


## Mac `defaults write` overrides:

I hate animation, turn them all off:

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

4. "Mac Override" Default

```bash
# Allow close finder
defaults write com.apple.finder AppleShowAllFiles -bool YES
killall Finder

# Disable unwanted animation

# opening and closing windows and popovers
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# smooth scrolling
defaults write -g NSScrollAnimationEnabled -bool false

# showing and hiding sheets, resizing preference windows, zooming windows. float 0 doesn't work
defaults write -g NSWindowResizeTime -float 0.001

# opening and closing Quick Look windows
defaults write -g QLPanelAnimationDuration -float 0

# rubberband scrolling (doesn't affect web views)
defaults write -g NSScrollViewRubberbanding -bool false

# resizing windows before and after showing the version browser
# also disabled by NSWindowResizeTime -float 0.001
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false

# showing a toolbar or menu bar in full screen
defaults write -g NSToolbarFullScreenAnimationDuration -float 0

# scrolling column views
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0

# showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0

# showing and hiding Mission Control, command+numbers
defaults write com.apple.dock expose-animation-duration -float 0

# showing and hiding Launchpad
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0

# changing pages in Launchpad
defaults write com.apple.dock springboard-page-duration -float 0

# at least AnimateInfoPanes
defaults write com.apple.finder DisableAllAnimations -bool true

# sending messages and opening windows for replies
defaults write com.apple.Mail DisableSendAnimations -bool true
defaults write com.apple.Mail DisableReplyAnimations -bool true

# reduce the "liquid glass" effect on macos (i guess?)
defaults write -g com.apple.SwiftUI.DisableSolarium -bool YES
```
