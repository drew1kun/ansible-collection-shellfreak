# Ansible role: tmux

[![MIT licensed][mit-badge]][mit-link]
[![Galaxy Collection][collection-badge]][galaxy-link]

Description
----

Cross-platform ansible role for installing and configuring popular terminal multiplexor - [tmux][tmux-link]

Requirements
----

**NOTE:** Role requires Fact Gathering by ansible!

One of the following OS (or deriviatives):

 - Debian | Ubuntu | CentOS/RHEL
 - MacOS (with [Homebrew][homebrew])

For MacOS:
if Homebrew is not installed on the managed host, install [geerlingguy.mac][geerlingguy-mac] collection via galaxy:

```bash
ansible-galaxy collection install geerlingguy.mac.homebrew
```

And include homebrew role in the playbook:

```yaml
roles:
  - geerlingguy.mac.homebrew
```

Role Variables
----
OS-Agnostic:

| Variable | Description | Default |
|----------|-------------|---------|
| `tmux_users[]` | List of users to setup tmux for | see [`defaults/main.yml`](defaults/main.yml) |

OS-Specific:

| Variable | Description | Default |
|----------|-------------|---------|
| `tmux_root_dir` | Root directory | <ul><li>Darwin: `/var/root`</li><li>Linux: `/root`</li></ul> |
| `tmux_home_dir` | User's home directory | <ul><li>Darwin: `/Users/`</li><li>Linux: `/home/`</li></ul> |

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
- hosts: dev_workstation_macos
  gather_facts: yes
  collections:
    - geerlingguy.mac
    - drew1kun.shellfreak
  roles:
    - homebrew
    - tmux
```

License
----

[MIT][mit-link]

Author Information
----

Andrew Shagayev | [e-mail](mailto:drewshg@gmail.com)

[collection-badge]: https://img.shields.io/badge/collection-drew1kun.shellfreak-green.svg

[galaxy-link]: https://galaxy.ansible.com/drew1kun/shellfreak/

[mit-badge]: https://img.shields.io/badge/license-MIT-blue.svg

[mit-link]: https://raw.githubusercontent.com/drew1kun/ansible-collection-shellfreak/main/LICENSE

[homebrew]: http://brew.sh/

[geerlingguy-mac]:https://github.com/geerlingguy/ansible-collection-mac

[tmux-link]:https://github.com/tmux/tmux/wiki