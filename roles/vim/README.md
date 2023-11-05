# Ansible role: vim

[![MIT licensed][mit-badge]][mit-link]
[![Galaxy Role][collection-badge]][galaxy-link]

Description
----

Ansible role that installs, configures and customizes vim editor.

The role does the following:

 - Removes **vim-tiny**
 - Installs **neovim** or **vim-nox** (required for Powerline plugin) depending on config
 - Sets `EDITOR` environment variable to use **neovim** (or **vim-nox** depending on config)
 - Installs [vim-plug][vim-plug-link] or [Vundle][vundle-link] plugin manager depending on config
 - Installs git (as a dependency for Vundle installation)
 - Installs set of Plugins defined in `default/main.yml`
 - Configures vim (system-wide or per-user) as defined in `default/main.yml` (using my custom configuration)
 - Installs [Solarized][solarized-link] and
   customized [Mustang][mustang-link] colorschemes.

IT IS NOT A GOOD IDEA to install [Emoji][emoji-link] plugin both system-wide and per user.
Vim sources both system-wide and user's vimrc files and complains about duplicated emoji command.
This will also cause command `vim +PluginInstall +qall` to hang or fail.

If installing current role system-wide and per user, comment `junegunn/vim-emoji` in `default/main.yaml` for system
installation and uncomment it for per-user installation.

### Use case #1: install for shared usage

  You want to install a custom vim settings and plugins in your remote server. This config is shared between all server
  users, but customized settings for a single user is allowed if you want.

  Set `vim_env` variable to `system` in your playbook.

  The common config is placed in `/etc/vim/vimrc.local` (for settings) and `/etc/vim/vimrc.bundles` (for plugins).

  If you need to overwrite any setting or install new plugins for a selected user, you need to put your settings in
  these files: `~/.vimrc.local` and `~/.vimrc.bundles.local`

  **Important**: by default, plugins are installed for `root` user. In all other users you have to install plugins
  manually with command `vim +PluginInstall`.

  Refer to [Vundle documentation][vundle-link] for plugin management.


### Use case #2: install for a single user

  You want to use this ansible role to provision your own laptop and just want a customized vim for your user.
  All your config lives in your `$HOME` path, just like regular vim install.

  Set `vim_env` variable to `user` in your playbook and set `vim_users` variable with a list of users to install vim.

  The common config is placed in `~/vimrc` (for settings) and `~/vimrc.bundles` (for plugins).

  If you need to overwrite any setting or install new plugins for a selected user, you need to put your settings in these files: `~/.vimrc.local` and `~/.vimrc.bundles.local`

  Refer to [Vundle documentation][vundle-link] for plugin management.

Requirements
----
Ansible  1.9 or greater

**NOTE:** If 'Down' task just hangs forever, this may be because of the following:

 - .vimrc or .vim files permissions (see 'which sudo' and become_method: su)
 - errors in .vimrc
 - misspelled plugin names: PlugInstall(or PluginInstall) triggers git, the "wish" GUI dialog for OpenSSH appears.

Role Variables
----
| Variable | Description | Default |
|----------|-------------|---------|
| `vim_cleanup` | remove all vim configuration customizations created by this role | `false` |
| `vim_env` | Where to install vim: system or user.<br/> If you install it system-wide, all users will use your default configuration. | `users` |
| `vim_users` | List of users to install vim. Use it in conjunction with `vim_env`. | `user` |
| `vim_neovim` | Install and configure neovim? | `true` |
| `vim_colorscheme` | which colorscheme to use? | `mustang` |
| `vim_plugin_manager` | Which plugin manager to use? Options: vundle (not recommended) or plug | `plug` |
| `vim_vundle_version` | Vundle version (used only when vim_plugin_manager is set to vundle - not recommended). | `v0.10.2` |
| `vim_plugins` | List of vim plugins to install. Use [Vundle](https://github.com/gmarik/Vundle.vim) format. | see [`defaults/main.yml`](defaults/main.yml#L23) |
| `vim_emoji_git_integration` | Itegrate emoji with gitgutter or signify (some people may not like the look). | `false` |

Dependencies
----

None


Example Playbook
----
Install collection:

```bash
ansible-galaxy collection install drew1kun.shellfreak
```

Play:

```yaml
- hosts: macbooks
  gather_facts: yes
  collections:
    - drew1kun.shellfreak
  roles:
    - role: vim
      vim_cleanup: yes
      vim_env: users
      vim_plugin_manager: plug
      vim_emoji_git_integration: no
      vim_neovim: yes
      vim_users: "{{ vim_vault_users }}"
      vim_colorscheme: nord
      vim_plugins: "{{ vim_github_plugins + vim_asyncomplete_plugins }}"
```

License
----

[MIT][mit-link]

Author Information
----

Andrew Shagayev | [e-mail](mailto:drewshg@gmail.com)

[collection-badge]:https://img.shields.io/badge/collection-drew1kun.shellfreak-green.svg

[galaxy-link]:https://galaxy.ansible.com/drew1kun/shellfreak/

[mit-badge]:https://img.shields.io/badge/license-MIT-blue.svg

[mit-link]:https://raw.githubusercontent.com/drew1kun/ansible-collection-shellfreak/main/LICENSE

[vim-plug-link]:https://github.com/junegunn/vim-plug

[vundle-link]:https://github.com/VundleVim/Vundle.vim

[solarized-link]:https://github.com/altercation/vim-colors-solarized#important-note-for-terminal-users

[mustang-link]:https://hcalves.deviantart.com/art/Mustang-Vim-Colorscheme-98974484

[emoji-link]:https://github.com/junegunn/vim-emoji