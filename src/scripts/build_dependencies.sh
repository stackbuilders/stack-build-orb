stack build \
  --stack-yaml "$STACK_YAML" \
  --no-terminal \
  "$STACK_ARGUMENTS" \
  --dependencies-only \
  --bench \
  --no-run-benchmarks \
  --test \
  --no-run-tests
