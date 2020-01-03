this is a bosh release for https://github.com/capitalone/bash_shell_mock/tree/54b16cb7efd42ed90e8388852db198b66e5c46a7

# Properties
```
install_location: 
    required: true
    description: the location of your tests
```

example manifest:
```
---
name: mock

releases:
  - name: bats
    version: latest
  - name: bash_shell_mock
    version: latest

update:
  canaries: 2
  max_in_flight: 1
  canary_watch_time: 5000-60000
  update_watch_time: 5000-60000
  
stemcells:
  - alias: default
    os: ubuntu-xenial
    version: latest

instance_groups:
  - name: mock
    azs: [z1, z2, z3]
    instances: 1
    vm_type: default
    stemcell: default
    persistent_disk: 10240
    networks:
      - name: default
    jobs:
      - name: run_bats
        release: bats
        properties:
          test_location: 'sample.bats'
          working_directory: '/var/vcap/packages/install_bash_shell_mock/sample-bats/'
      - name: install_bash_shell_mock
        release: bash_shell_mock
        properties:
          install_location: '/var/vcap/packages/install_bash_shell_mock/sample-bats/'
      
      
```