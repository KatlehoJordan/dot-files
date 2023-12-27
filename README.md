# dot-files

This repository is to capture my various dot-files, settings, etc.

## Software to reinstall after a factory reset

### Windows

git bash
chrome
snipping tool
vs code
signal
MS teams
MS Office (Excel, Word, Powerpoint)
Powershell
7zip
flux
bank ID
docker desktop
mullvad vpn
PowerToys (for keyboard remapping)
nvim
lua

### Special tips

- [On line endings](https://www.shellcheck.net/wiki/SC1017)
- [On re-importing VS Code profile](https://github.com/microsoft/vscode/issues/168867)

### Ubuntu

zsh
tmux
i3
nvim
vs code
7zip
chrome
python (3.11.4)
curl
[poetry (1.6.1)](https://python-poetry.org/docs/) - follow instructions for adding shell completions also

## Other changes to make when setting up new computer

- Language packages for Microsoft Office
  - Swedish
  - Catalan
- Auto-complete rules
  - two hyphens to make en-dash
  - three hyphens to make em-dash

## Using SSH

To use SSH between computers you need to have the right software setup on your server and the client.

These instructions are modified from [this link](https://www.cyberciti.biz/faq/how-to-install-ssh-on-ubuntu-linux-using-apt-get/).

Your server is likely to be a Linux machine.

In your Linux machine:

```sh
sudo apt install openssh-server
sudo systemctl enable ssh
sudo ufw allow ssh
```

Then you will need to retrieve your IP address for the machine. IPv6 can be used.

From the client:

```sh
ssh user@ip
```

Then enter the password when prompted. After connected, if you wish to disconnect:

```sh
exit
logout
```

To use the SSH Extension with VS code, you will want to modify the file at `~/.ssh/config` so that it has this format:

```plaintext
Host memorable-name
  User user
  HostName IPv6-address
```

You should be able to connect to the server via a stand-alone terminal or VS Code now, although there is a known (apparently-harmless) bug in VS Code that asks for the password repeatedly although you have already been connected.

## Notes regarding setup as inspired by The Primeagean

The Primeagean provided a couple of videos to show his developer setup on Linux.

<https://www.youtube.com/watch?v=bdumJIHabhQ>

or

<https://www.youtube.com/watch?v=bdumJlHabhQ>

### Keybindings in editors vim

I learned neovim predominantly by watching his videos, which are not linked here.

### windows manager: i3

<https://i3wm.org/docs/userguide.html#:~:text=2.10.-,Exiting%20i3,you%20really%20want%20to%20quit>.

- If using windows as the modifier key, relatively intuitive to bounce between apps (windows + arrow)
- Also easy to move them (windows + shift + arrow)
- Also easy to move between workspaces (windows + number)
- Also easy to move apps to other workspaces (windows + shift + number)

- key shortcuts to know
  - windows + enter (launch a terminal)
  - windows + shift + q (kill an application)
  - windows + shift + x (end i3 session) - then key based on prompt
  - windows + shift + e (end i3 session)
  - windows + d (search for an app to start)

#### Problems

- INCOMPLETELY FIXED
  - Failed to shut down from i3 successfully last time, requiring a hard shut down
    - Failed to modify the i3/config file so that the shutdown hot key works. However, figured out that Ubuntu will shutdown if you push the shutdown button on the computer, and that seems to work fine. The other hotkeys work well, including the lock screen function; type your password to unlock.
  - Mouse continuity between screens is not as intuitive (left to right, not top to bottom)
    - <https://www.reddit.com/r/i3wm/comments/5abvb6/swapping_monitor_position/>
    - To see displays: `xrandr`
    - To then rearrange displays: `xrandr --output <name of upper display> --above <name of lower display>`
      - Other directions: --below --right-of --left-of
      - <https://www.thinkwiki.org/wiki/Xorg_RandR_1.2>
    - I have put this in my config, but WARNING, this will not work on other machines if the display names are not identical to those on my home setup
  - also keeps logging me out of/breaking Google Chrome sync (if do not exit gracefully first)
    - Exit all apps gracefully (windows + shift + q) before exiting i3
  - also, using open from tmux here seems to lock the terminal session until the opened file is closed (I don't think I saw this in the non-i3 windows manager)
    - <https://superuser.com/questions/513496/how-can-i-run-a-command-from-the-terminal-without-blocking-it>
    - when using `open`, append with `& disown` to keep the terminal active and dissociate the terminal from the running application
  - also does not use code to open text files when using `open`
    - Just have to be disciplined and use `code <my file>`
  - Upon starting up Linux kernel, getting error messages printed to the log:
    - <https://www.kubuntuforums.net/forum/currently-supported-releases/kubuntu-22-04-jammy-jellyfish/post-installation-ax/662598-boot-shut-down-errors-acpi-error-no-pointer-back-to-namespace-node-in-package>
    - Basically, these warnings are unavoidable on some motherboards when running Linux. But they are non-harmful.
      - ACPI Error: No pointer back to namespace node in package (____ptr
            val____) (20221020/dsargs-301)
            /dev/sda5: clean, 275504/19980288 files, 10926123/79892480 blocks
            ACPI Error: No pointer back to namespace node in package 00000000bab72184 (20221020/dsargs-301)
            ACPI Error: Aborting method \_SB.PCI0.B0D4.PPCC due to previous error (AE_AML_INTERNAL) (20221020/psparse-)
            kfd kfd: amdgpu: TOPA2 not supported in kfd

- PERMANENTLY FIXED
  - How to change to US international keymap:
    - From terminal `setxkbmap -layout us -variant intl` (askubuntu.com/questions/963659)
  - How to add/connect to alternative wireless networks
    - From terminal `nmtui` (askubuntu.com/questions/896140)
  - How to access the settings to, for example, modify key-repeat speed?
    - `env XDG_CURRENT_DESKTOP=GNOME gnome-control-center`
  - How to take and save screenshots?
    - <https://dev.to/dianjuar/i3wm-screenshot-shortcuts-3n7b>
  - Need to remap keys:
    - Maybe this will help? <https://faq.i3wm.org/question/1496/change-caps-lock-to-esc-in-i3.1.html>
    - These two remove caps lock functionality completely without moving it to escape key
      - xmodmap -e "clear lock"
      - xmodmap -e "keysym Caps_lock = Escape"
      - Alternatively try:
        - setxkbmap -layout us -option caps:escape
    - Adds escape but does not remove caps lock: <https://jaketrent.com/post/remap-keys-i3/>
      - xmodmap -e "keycode 66 = Escape NoSymbol Escape"
    - Not sure if this would work if done first: <https://www.reddit.com/r/i3wm/comments/2xoo9m/what_is_the_best_way_to_remap_ctrlkey_with/?rdt=57123>
      - setxkbmap -option escape:swapcaps
  - Do not know how to quit i3 without the mouse
    - <https://unix.stackexchange.com/questions/483934/how-can-i-exit-i3-without-using-a-mouse>
  - Need to find out to create new workspaces for further extensibility
    - Choose an open application, then use windows + shift + number to create the new workspace

### terminal: tmux

<https://linuxhint.com/attach-tmux-to-existing-session/>
<https://tmuxcheatsheet.com/>

ctrl f to fuzzy find anywhere?

## Python with pyenv and poetry in Windows

These instructions modified from [here](https://endjin.com/blog/2023/03/how-to-setup-python-pyenv-poetry-on-windows).

Although one can install python system-wide, it is likely better to first have a virtual environment manager setup to manage your python versions. Thereafter, poetry is convenient for managing your python packages.

Start by installing `pyenv`:

```sh
git clone https://github.com/pyenv-win/pyenv-win.git $HOME/.pyenv
```

Add it to the path by updating your `.bashrc` file.

Then install your `python` version of choice, using `pyenv install --list` to find the version that is most recent and relevant for you. Then install and make the global version the same with:

```sh
pyenv install <version>
pyenv global <version>
```

Next, to download the install file for `poetry`, it is possible from powershell with:

```powershell
Invoke-WebRequest -Uri "https://install.python-poetry.org" -UseBasicParsing -OutFile "$HOME/Downloads/install-poetry.py"
```

Then to install it, you go back to bash and run:

```sh
pyenv exec python $HOME/Downloads/install-poetry.py
```

Finally, you can confirm it worked by opening a fresh bash terminal and running:

```sh
poetry --version
```
