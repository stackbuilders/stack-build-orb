STACK_YAML=$(circleci env subst "$PARAM_STACK_YAML")
HLINT_YAML_URL=$(circleci env subst "$PARAM_HLINT_YAML_URL")

if [ -n "$HLINT_YAML_URL" ]; then
  curl -L -o .hlint.yaml "$HLINT_YAML_URL"
fi

stack exec \
  --stack-yaml "$STACK_YAML" \
  --no-terminal \
  hlint .
