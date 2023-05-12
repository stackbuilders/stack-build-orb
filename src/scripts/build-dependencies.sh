STACK_YAML=$(circleci env subst "$PARAM_STACK_YAML")
STACK_ARGUMENTS=$(circleci env subst "$PARAM_STACK_ARGUMENTS")

stack build \
  --stack-yaml "$STACK_YAML" \
  --no-terminal \
  $STACK_ARGUMENTS \
  --dependencies-only \
  --bench \
  --no-run-benchmarks \
  --test \
  --no-run-tests
