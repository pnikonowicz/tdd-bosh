this is a bosh release for https://github.com/capitalone/bash_shell_mock/tree/54b16cb7efd42ed90e8388852db198b66e5c46a7

# Properties
```
install_location: 
    required: true
    description: the location of your tests
```

# Run sample tests

```
bosh -e vbox deploy bash_shell_mock/manifests/run_sample_tests.yml -d run_sample_tests && bosh -d run_sample_tests run-errand run_bats
```
