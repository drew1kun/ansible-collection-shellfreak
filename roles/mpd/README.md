# Ansible role: mpd

[![MIT licensed][mit-badge]][mit-link]
[![Galaxy Collection][collection-badge]][galaxy-link]

Description
----

Cross-platform ansible role for installation and configuration of MPD, MPC and NCMPCPP on MacOS and Linux Systems.

Requirements
----

NOTE: Role requires Fact Gathering by ansible!

One of the following OS (or deriviatives):

 - Debian | Ubuntu
 - MacOS (with [Homebrew][homebrew])

For MacOS:
if Homebrew is not installed on the managed host, install [geerlingguy.mac][geerlingguy-mac] collection via galaxy:

```bash
ansible-galaxy collection install geerlingguy.mac
```

 And include homebrew role in the playbook:

```yaml
roles:
  - geerlingguy.mac.homebrew
```

Role Variables
----

For installing only MPD set mpd_install_mpc and mpd_install_ncmpcpp to 'False'

For installing only ncmpcpp (or mpc) set the corresponding variable to 'True' and
run the playbook with role specifying tags:

```
ansible-playbook ./playbook.yml --tags 'mpc,ncmpcpp'
```

OS-Agnostic:

| Variables | Description | Default|
|-----------|-------------|--------|
| `mpd_autostart` | Start mpd automatically | `yes` |
| `mpd_install_mpc` | Install mpc cli client | `yes` |
| `mpd_install_ncmpcpp` | Install ncmpcpp or not | `yes` |
| `mpd_users[]` | List of ncmpcpp users | `[drew, root]` |
| `mpd_port` | Port mpd will run on | `6600` |
| `mpd_bind_to_address` | IP address on which mpd will listen | <ul><li>Darwin: `~/.mpd/socket` </li><li>Linux: `/var/lib/mpd/socket`</li> see [`defaults/main.yml`](defaults/main.yml)</li></ul> |
| `mpd_config_base` | MPD Configuration, except the audio_outputs | <ul>see [`defaults/main.yml`](defaults/main.yml)</ul> |

OS-Specific (Mac and Linux):


| Variables | Description | Default|
|-----------|-------------|--------|
| `mpd_config_outputs_linux[]` | list of audio_outputs for Linux | <ul> `ALSA` see [`defaults/main.yml`](defaults/main.yml)</ul> |
| `mpd_config_outputs_macos[]` | list of audio_outputs for MacOS | <ul> `OSX (CoreAudio)` see [`defaults/main.yml`](defaults/main.yml)</ul> |
| `mpd_config_outputs_common[]` | list of OS-agnostic audio_outputs | <ul> `FIFO, HTTP` see [`defaults/main.yml`](defaults/main.yml)</ul> |


Firewalld-Specific:

| Variables | Description | Default|
|-----------|-------------|--------|
| `mpd_firewalld` | Configure firewalld to allow incoming connections to MPD | `true` |
| `mpd_firewalld_zones` | Open MPD port only for the list of these firewalld zones | `[ public ]` |

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
- hosts: dev_clients_macos
  gather_facts: yes
  collections:
  	- geerlingguy.mac
  	- drew1kun.shellfreak
  roles:
  	- homebrew
  	- mpd
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

[homebrew]:http://brew.sh/

[geerlingguy-mac]:https://github.com/geerlingguy/ansible-collection-mac