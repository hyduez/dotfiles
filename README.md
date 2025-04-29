### 2025-04-28 23:31
I made preferences for i3-gaps, added wakatime plugin to LazyVim, keyboard layouts to i3 and I installed pulseaudio, yea, after 4 days I installed Void, until this day I havent installed an audio service. I know my polybar's style is gnome-like, but it is the way I like. I forgot to update my readme in this commit, i.e in the previous one
<details>
  <summary>Screenshot</summary>
  <div align="center">
    <image src="https://envs.sh/4HP.png" alt="screenshot" />
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
