get-pip.py:
  cmd.run:
    - name: curl -s -S --retry 5 -O https://bootstrap.pypa.io/get-pip.py
    - creates: /home/vagrant/get-pip.py

pip:
  cmd.run:
    - name: sudo python get-pip.py

