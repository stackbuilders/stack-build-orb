STACK_YAML=$(circleci env subst "$PARAM_STACK_YAML")
STACK_ARGUMENTS=$(circleci env subst "$PARAM_STACK_ARGUMENTS")

stack install \
  --stack-yaml "$STACK_YAML" \
  --no-terminal \
  --copy-compiler-tool hlint \
  "$STACK_ARGUMENTS"
