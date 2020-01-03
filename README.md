# structure
## bats
bats release (https://github.com/sstephenson/bats)

## bash_shell_mock
bash_shell_mock release (https://github.com/capitalone/bash_shell_mock)

## excercises
a test release that can show how to tdd a bosh release

# run all tests


Upload bats release:
```
cd bats
bosh create-release --force && bosh upload-release
```

Uplaod bash_shell_mock release:
```
cd bash_shell_mock
bosh create-release --force && bosh upload-release
```

run all tests:
```
./run_all_tests.sh
```
