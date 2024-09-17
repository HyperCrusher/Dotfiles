# My NixOS Dotfiles

Welcome to my personal NixOS configuration and dotfiles repository! This setup reflects my unique workflow and preferences, designed with simplicity and cross-system compatibility in mind. While it may not be the most complex configuration out there, I've strived to minimize the effort required to make this setup work seamlessly across different systems.

## My Digital Toolbox

Here's a snapshot of the key components that power my daily computing:

- **Xanmon**: My kernel of choice for enhanced performance
- **Neovim**: The versatile text editor at the core of my coding and writing tasks
- **BSPWM**: A sleek tiling window manager for an organized workspace
- **Zsh**: A feature-rich shell with extensive customizations
- **JetBrains Mono**: My preferred font, offering clarity and readability
- **Zen Browser**: A custom, distraction-free browsing experience (implemented via a flake)

## User Configuration

The user setup is central to this configuration. Here's a brief overview:

- Users import their desired software collections
- Software is categorized, with imports managed by the consuming user
- User configurations are found in `nixos/home/users`
- Package categories are located in `nixos/home/packages`

To incorporate dotfiles, users should include the `packages/dotfiles.nix` file.

A default `user.nix` is provided, leveraging `nixos/lib/user.nix` to define email, hostname (username), and username (lowercase). This creates a standard user with all packages, picom, and BSPWM.

Additionally, there's a work user profile featuring web browsers, office tools, and terminal utilities - ideal for a focused, non-developer-centric work environment.

## Getting Started

To adopt this setup:

1. Clone the repository
2. Build from the `flake.nix` file

For most users, modifying `nixos/lib/user.nix` with your username should suffice. The configuration is designed to be intuitive and straightforward.

While untested, the `nixos/home/user.nix` files may be adaptable for home-manager systems. A future goal is to test and refine this setup for use as a distribution-agnostic home-manager configuration, ensuring portability of these dotfiles across various environments.
