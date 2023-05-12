# TODO: once committing the cabal file catches on, we can just
# assume it exists and md5sum *.cabal here.
find . -maxdepth 1 -type f \
  -name package.yaml -name '*.cabal' \
  -exec md5sum {} + > project.digest

git ls-files | xargs md5sum > source.digest
