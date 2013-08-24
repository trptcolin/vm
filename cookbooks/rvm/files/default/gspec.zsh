# TODO:
# - filter on a regex
# - pass options to rspec

gspecs_modified() {
  git status --porcelain |
    awk ' { print ( $(NF) ) }' |
    grep '^spec' |
    xargs -I '{}' find '{}' -name "*_spec.rb" 2>/dev/null
}

gspecs_run() {
  tee > /dev/tty |
    xargs --no-run-if-empty bundle exec rspec
}


gspec() {
  gspecs_modified | gspecs_run
}

