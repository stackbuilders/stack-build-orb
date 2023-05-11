# Stack Build Orb

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/stackbuilders/stack-build-orb/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/stackbuilders/stack-build-orb/tree/main)

Built, test, and lint Stack-based Haskell projects in your CircleCI jobs.

## Usage

```yaml
version: 2.1

orbs:
  stack-build: stackbuilders/stack-build@x.y.z

workflows:
  commit:
    jobs:
      - stack-build/build-test-lint:
          name: "default"
      - stack-build/build-test-lint:
          name: "ghc-8.8.3 / lts-15.12"
          stack-yaml: stack-lts-15.12.yaml
      - stack-build/build-test-lint:
          name: "ghc-8.6.5 / lts-14.27"
          stack-yaml: stack-lts-14.27.yaml
      - stack-build/build-test-lint:
          name: "ghc-8.4.3 / lts-12.10"
          stack-yaml: stack-lts-12.10.yaml
      - stack-build/build-test-lint:
          name: "nightly"
          stack-yaml: stack-nightly.yaml
          stack-arguments: --resolver nightly
          hlint: false
          weeder: false
```

See [all examples](./src/examples/).

---

[LICENSE](./LICENSE) | [CHANGELOG](./CHANGELOG.md)
