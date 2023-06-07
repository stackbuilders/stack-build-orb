STACK_YAML=$(circleci env subst "$PARAM_STACK_YAML")

stack exec \
  --stack-yaml "$STACK_YAML" \
  --no-terminal \
  weeder
