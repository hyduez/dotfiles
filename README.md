### 2025-05-04 21:38
Sup, those were 7 days without any update, but I was busy learning C++, I started to make some small programs, later I decided to use glib (GTK's library low-level for C++), so I had to link the installed packages, and like I was using flakes to do it, I prefer dont do it, vcpkg gave my troubles before, conan worked for me. Now I'm learning Rust, to use it later, with cargo and crane (a flake's util), to make that thing I want to do. For now, I'm learning concurrent programming `(std::thread)`, `async-await` (tokio crate) and testing (`#[cfg(test)]`). I'm also interesed to learn about algorithms, one of my friends, that is studying at university, told me about some algorithms and how calculate it complexity, yk, that thing of omega (n) powered by two. I added rofi themes, that are from edu-flores' dotfiles, and some plugins to lazyvim like wakatime stats and deleted one file that was a logger file. Oh, right, I deleted xfce4-related packages, now Im ussing only lxde-appareance and to take screenshots im using ***maim***. In the next week I will come back to high-school, one week more and my vacation is over. I will study some type of sort algorithms like bubble, quick, insert, trees, graphs, manacher and binaries schemes.
<details>
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
