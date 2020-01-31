Objective

To demonstrate a way to TDD a bosh release. These tests should be deterministic, and be the type of quality tests that would allow for both improved speed in development of a bosh release, and it’s quality to be improved. 


Requirements
bosh cli
Laptop
Job templtes ruby gem (Utilizes https://bosh.io/docs/job-templates/ 
Ruby bundler (for tests)
Bosh lite (https://bosh.io/docs/bosh-lite/ or https://github.com/cloudfoundry/cf-deployment/tree/master/iaas-support/bosh-lite)

Prerequisites
The class should have a proficient understanding and/or hands on experience with the following:
TDD
Networking
Ruby erb templating
Bash Scripting
The CF-Onboarding course should have already been completed


Setup
Have each student run https://github.com/pnikonowicz/tdd-bosh/blob/master/run_all_tests.sh on their local machines. 

Teacher
Location for course materials: https://github.com/pnikonowicz/tdd-bosh



Discussion
What is BOSH-lite? Why would we use it? 
BOSH Lite v2 is a Director VM running in VirtualBox (typically locally). It is managed via CLI v2. Internally CPI uses containers to emulate VMs which makes it an excellent choice for:
General BOSH exploration without investing time and resources to configure an IaaS
Development of releases (including BOSH itself)
Testing releases locally or in CI

Source: https://bosh.io/docs/bosh-lite/

Types of tests

Testing job template:
These tests will utilize the “job-template” utility that is on the bosh github repo. This allows properties and links to be mocked out. The majority of testing will take place here. Unlike integration testing, these tests can be exhaustive and should be easy to see when a mistake is made.

Testing template execution:
Using bats release (https://github.com/pnikonowicz/tdd-bosh/tree/master/bats) to create a job that will run the BATS tests as an errand. Bats is a TAP-compliant testing framework for Bash. It provides a simple way to verify that the UNIX programs you write behave as expected.

Testing template execution with mocks:
Uses the bash shell mock release (https://github.com/pnikonowicz/tdd-bosh/tree/master/bash_shell_mock). Shellmock is a bash shell script mocking utility/framework. It was written to be a companion of the Bash Automated Testing System.


Plan

Unit Tests
Recreate in front of class https://github.com/pnikonowicz/tdd-bosh/blob/master/excercises/src/spec/stdout_spec.rb
Turn over to class and have them try their own template expansion
BATS Test
Recreate in front of class https://github.com/pnikonowicz/tdd-bosh/blob/master/excercises/src/bats/simple.bats
Mock Bats
Demonstrate how to use https://github.com/pnikonowicz/tdd-bosh/blob/master/excercises/manifests/mock.yml
NOTE: YOU CANNOT MOCK ECHO or PRINT or PRINTF!!!!




Thoughts: 
This might be better as part of the CF-Onboarding. Do a trial run first and ask participants for their opinion. Also, talk to the onboarding channel #nyc-exploring-leaders. 


Recruiting Template:

Hello @BOSH Windows Team and @Garden Windows Team, we have created a TDD Bosh course that we believe you would be interested in. At the end of the course you will be able to:
1) run template unit tests against job templates
2) run integration tests against releases
3) mock/stub behavior in your integration tests against releases
All this will be using [bosh lite](https://bosh.io/docs/bosh-lite/) which should make things move pretty fast.
Perquisites:
1) general bosh knowledge (job/template/spec/etc)
2) a laptop
3) experience with test driving software (TDD/BDD/UAT/etc)
Please reply in this thread if interested. This course will be about 1/2 a day. Thanks!

