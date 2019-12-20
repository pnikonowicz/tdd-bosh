# bats

this is a bosh release for https://github.com/sstephenson/bats.

# Properties
*test_location*: the file that is your test
*working_directory*: the location that bats should run from

example manifest from https://github.com/pnikonowicz/tdd-bosh:

```
---
name: simple

releases:
  - name: excercises
    version: latest
  - name: bats
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
  - name: simple
    azs: [z1, z2, z3]
    instances: 1
    vm_type: default
    stemcell: default
    persistent_disk: 10240
    networks:
      - name: default
    jobs:
      - name: main
        release: excercises
        provides: {}
        properties: 
          strings:
            message: we are inside
      - name: run_bats
        release: bats
        properties:
          test_location: '/var/vcap/packages/bats/simple.bats'
          working_directory: '/var/vcap/jobs/main/'         

```

