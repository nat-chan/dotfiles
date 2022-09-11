session_name: monitor
windows:
- focus: 'true'
  layout: db13,159x24,0,0{79x24,0,0,211,79x24,80,0[79x12,80,0,212,79x11,80,13,213]}
  options:
    automatic-rename: 'off'
  panes:
  - shell_command:
    - cd ~
    - conda activate base
    - tmux rename-session monitor$(hostname -I|grep -oP '(?<=192.168.0.1)\d*')
    - nvtop
  - shell_command:
    - cd ~
    - conda activate base
    - vtop
  - focus: 'true'
    shell_command:
    - cd ~
    - conda activate base
    - watch -n 1 -d  -c -t pydf
  window_name: python
# vim:ts=2 sw=2
