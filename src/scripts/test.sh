STACK_YAML=$(circleci env subst "$PARAM_STACK_YAML")
STACK_ARGUMENTS=$(circleci env subst "$PARAM_STACK_ARGUMENTS")


# shellcheck disable=SC2086
stack build \
  --stack-yaml "$STACK_YAML" \
  --no-terminal \
  --test \
  $STACK_ARGUMENTS
