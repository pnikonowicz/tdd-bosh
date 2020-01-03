this is a bosh release for https://github.com/capitalone/bash_shell_mock

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
