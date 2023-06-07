# Manual tasks
### How to generate `REFERENCE.md`
```
puppet strings generate --format markdown
```

### How to run Puppet lint
```
bundle exec rake validate lint check
```

### How to run unit tests
```
bundle exec rake spec
```

### How to run rubocop
```
bundle exec rake rubocop
```