# Dotfiles, baby!

### 🐧 ❤️ 🚀
As of May 2020, I completely redesigned my dotfiles to enable use of [`GNU Stow`]([https://www.gnu.org/software/stow/](https://www.gnu.org/software/stow/)) to allow for sane management of dotfiles.

Currenly the following programs are version controlled:
+ [`zsh`]([https://www.zsh.org/](https://www.zsh.org/)) 
+ [`nvim`]([https://neovim.io/](https://neovim.io/))
+ [`alacritty`]([https://github.com/alacritty/alacritty](https://github.com/alacritty/alacritty))
+ [`iterm2`]([https://www.iterm2.com/](https://www.iterm2.com/))
+ [`tmux`]([https://github.com/tmux/tmux](https://github.com/tmux/tmux))
+ [`npm`]([https://www.npmjs.com/](https://www.npmjs.com/))

Each of them are discussed in more detail below.

Here is a screenshot of my terminal. My daily driver terminal of choice is Alacritty with the [Molokai]([https://github.com/tomasr/molokai](https://github.com/tomasr/molokai)) color scheme. I use the same color scheme on vim too!

My backup/alternative color schemes include: [Solarized Dark]([https://ethanschoonover.com/solarized/](https://ethanschoonover.com/solarized/)) for when I really need a change from the monotony of Molokai - See what I did there :')

![Screen Shot 2020-05-26 at 1 40 29 AM](https://user-images.githubusercontent.com/20383602/82840975-1cc26e80-9ef2-11ea-856c-a410bb7dbecb.jpg)

Now each of the programs that I manage is discussed in more detail below.

## Z-Shell

I use ZSH as my shell of choice. As of May 2020, I moved away from the oh-my-zsh framework and decided on using a ZSH plugin manager called [`zplug`]([https://github.com/zplug/zplug](https://github.com/zplug/zplug)).
  + **zshrc**\
  This includes all the necessary configuration for zsh and zplug
  including any themes that I may be using, along with the plugins that
  I use. I continue to find that the [RobbyRussell]([https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/robbyrussell.zsh-theme](https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/robbyrussell.zsh-theme)) theme for ZSH works well for my needs
  + **aliases**\
  All my custom aliases live in here. Stuff like clearing the screen faster,
  changing to commonly used directories, and more, all go in here.
  + **functions**\
  All the bash functions that I write end up here. Stuff like automatically 
  sshing into Brown university department computers are written in here.
  + **fzf.zsh**\
  Special mention to the [`fzf`]([https://github.com/junegunn/fzf](https://github.com/junegunn/fzf)) command since so much of my workflow in both the shell and vim revolves around the use of fzf. Essentially, it is a fuzzy finder that allows me to quickly find files, change directories, fuzzy find tmux sessions, and even fuzzy find git files to be staged! It really is amazing!

## Neovim

[`neovim`]([https://neovim.io/](https://neovim.io/)) is my editor of choice. I decided on migrating to neovim for primarily 2 reasons: 
* Much better autocompletion using [`deoplete`]([https://github.com/Shougo/deoplete.nvim](https://github.com/Shougo/deoplete.nvim))
* The philosophy behind neovim

+ **init.vim**\
  All plugins that I use, custom mappings, all live in here.

## Alacritty

As a novice terminal user, I used iTerm2 for the longest time. It was good but there were a few inherent problems with it. It was slow on startup, commands did not update smoothly, and the configuration seemed a bit Windows-like. 
The answer: [Alacritty]([https://github.com/alacritty/alacritty](https://github.com/alacritty/alacritty)).
Blazing fast using the GPU for acceleration, I experienced a 10x speed bump. Moreover, the configuration uses a dotfiles just like any other sane unix program.

+ **alacritty.yml**\
This is pretty minimal other than some standard font size, non-tabbed mode, and color scheme settings.

## Tmux

One of the downsides of using Alacritty is the lack of tabbed support. While this could be a problem for some, I viewed this as an advantage and saw this as an opportunity for inculcating a terminal multiplexer into my workflow. Tmux seemed like the obvious choice given its extensibility to panes, windows, sessions, and session management. 

+ **tmux.conf**\
The noticeable changes include shifting the window manager to the bottom center of the screen, changes to the status right where the date and time is displayed, and starting session and window numbers from 1 since I find that easier to reach from the prefix key rather than the 0.

## setup
In addition to the above, my dotfiles directory also includes a setup folder 
that has three files:
  + **brew.sh**\
  This is a shell script that installs [homebrew](https://brew.sh/). 
  All terminal and graphical applications that I use on my machine are managed 
  through homebrew.
  + **mac_settings.sh**\
  Also a shell script that modifies some of the OS X specific settings. In brief, 
  I more or less just do some efficiency related tasks such as disable workspace 
  animations, change the screenshot file type and location, and disable writing 
  of *.DS_Store* files (for more information, read the inline comments).
  To learn more about terminal OS X customization, have a read at: 
  <http://defaults-write.com/>
  + **sym_links.sh**\
  Archived, for possible use with Linux dotfiles management!
+ **dotfiles.sh**\
  This is a wrapper script that makes use of `stow` to stash all dotfiles using symlinks. It was one of the only sane ways of managing dotfiles that felt clean.
+ **vim_setup.sh**\
 Deoplete does require some custom python modules such as pynvim. This may be moved into one of the other scripts but it feels right to put it into a script of its own for now.
 + **cleanup.sh**\
 This just clears up unneeded dotfiles from the `$HOME` directory such as `~/.bash_history`, `~/.bash_profile`, `~/.lesshistory`, `~/.viminfo`, and others!
