act-build:
  gh act -W .github/workflows/docker-image.yml pull_request | tee build.log

