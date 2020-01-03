# tdd-bosh


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
