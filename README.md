<div align='center'>
  <h1>git@codeberg.org:paulo/dotfiles</h1>
  <p>«dotfiles» is a term for the hidden files on a Unix-like system (where files starting start with a dot (.) are hidden from ls command), commonly related to configuration files. Currently I'm using <a href='https://voidlinux.org/' target='_blank'>Void Linux</a> (glibc) with <a href='https://isaacfreund.com/software/river/' target='_blank'>River</a>, a Wayland compositor, as default graphical environment</p>
</div>

## Index of Contents
- [🚊 Introduction](#introduction): A little overview about what I did with my distro
- [🌓 Structure](#structure): Structure of dotfiles and how system works
- [💊 Scripts](#scripts): Scripts to automate some functions like making symbolic links
- [☁️ Notes](#notes): Some fundamental things to do to get this working propertly

## Introduction 
Alright, I'm not a fan of autologin, so I use SSDM to login manually, not tty cuz then I won't be able to select what graphical session I want, so that.

With River (Wayland) I use:
- waybar
- grim
- slurp
- swww
- pipewire
- rofi
- dunst
- wl-clipboard

With BSPWM (Xorg):
- polybar
- sxhkd
- rofi
- dunst
- clipmenud
- pipewire

General Software:
- opendoas
- nix
- kitty
- btop
- fastfetch
- lazyvim
- starship
- zsh
- thunar
- nnn
- amfora
- librewolf
- inkscape
- passwordsafe

## Structure

<details>
  <summary>Old Content</summary>

  ### 2025-06-08 14:34
  Weekly updates!! I updated background and i got envs.net shell access, so now I have a website and a blog at [paulov.envs.net](https://paulov.envs.net/) and a gemini capsule at gemini://envs.net/~paulov :) Get more updates, day by day, in my [twtxt](https://paulov.envs.net/twtxt.txt) instance
  <details>
    <summary>Screenshot</summary>
    <div align="center">
      <img src="https://envs.sh/aJ9.png" alt="screenshot" />
    </div>
  </details>

  ### 2025-05-19 11:30
  I removed picom and using bspwn native transparency, disabling animations doing it less laggy
  <details>
    <summary>Screenshot</summary>
    <div align="center">
      <img src="https://envs.sh/rYp.png" alt="screenshot" />
    </div>
  </details>

  ### 2025-05-09 19:45
  I migrated from i3 to bspwm and I removed some directories. Fixed mason 2.0 break changes 
  <details>
    <summary>Screenshot</summary>
    <div align="center">
      <img src="https://envs.sh/7tI.png" alt="screenshot" />
    </div>
  </details>

  ### 2025-05-04 21:38
  Sup, those were 7 days without any update, but I was busy learning C++, I started to make some small programs, later I decided to use glib (GTK's library low-level for C++), so I had to link the installed packages, and like I was using flakes to do it, I prefer dont do it, vcpkg gave my troubles before, conan worked for me. Now I'm learning Rust, to use it later, with cargo and crane (a flake's util), to make that thing I want to do. For now, I'm learning concurrent programming `(std::thread)`, `async-await` (tokio crate) and testing (`#[cfg(test)]`). I'm also interesed to learn about algorithms, one of my friends, that is studying at university, told me about some algorithms and how calculate it complexity, yk, that thing of omega (n) powered by two. I added rofi themes, that are from edu-flores' dotfiles, and some plugins to lazyvim like wakatime stats and deleted one file that was a logger file. Oh, right, I deleted xfce4-related packages, now Im ussing only lxde-appareance and to take screenshots im using ***maim***. In the next week I will come back to high-school, one week more and my vacation is over. I will study some type of sort algorithms like bubble, quick, insert, trees, graphs, manacher and binaries schemes.
  <details>
    <summary>Screenshot</summary>
    <div align="center">
      <img src="https://envs.sh/l6y.png" alt="screenshot" />
    </div>
  </details>

  ### 2025-04-28 23:31
  I made preferences for i3-gaps, added wakatime plugin to LazyVim, keyboard layouts to i3 and I installed pulseaudio, yea, after 4 days I installed Void, until this day I havent installed an audio service. I know my polybar's style is gnome-like, but it is the way I like. I forgot to update my readme in this commit, i.e in the previous one
  <details>
    <summary>Screenshot</summary>
    <div align="center">
      <img src="https://envs.sh/4HP.png" alt="screenshot" />
    </div>
  </details>

  ### 2025-04-27 23:02
  I just added picom, polybar's config, nix and dunst and some keybinds to i3. Picom's animations are insane

  > [!TIP]
  > Void pool repository doesn't have nix at it latest version (2.28.2), it has 2.11. To install the latest version you need to install it from it script installer (`sh <(curl -L https://nixos.org/nix/install) --daemon`) (multi-user) and add your own service at `/etc/sv/` that executes `nix-daemon` as root.

  <details>
    <summary>Screenshot</summary>
    <div align="center">
      <img src="https://envs.sh/4R6.png" alt="screenshot" />
    </div>
  </details>

  ### 2025-04-27 00:57
  Void linux with glibc, cuz using musl is a headache. Installed at the first time with xfce4, and using it's ecosystem to enchance i3wm. GTK3+ as graphical engine and Xorg (X11) as display server. LightDM instead of sddm and gddm, cuz it works and its bloatedless. I dont use lemurs or lydm because lemurs doesnt work on non-systemd workflows and with lydm I have to compile it with Zig and it makes me lazy. (I use lazyvim, btw)
</details>