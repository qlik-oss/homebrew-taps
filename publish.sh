# Update checks if there are any changes present.
# It is meant to be run after 'go run publish.go'
# and push all the changes from it.
# If no changes are present, nothing is done.

publish() {
  diff=$(git diff)
  if [ -z $diff ]; then
    echo "No changes found, all done."
  else
    echo "Found changes to commit and push"
    echo "git add bin"
    git add bin
    echo "git add Formula/qlik-cli.rb"
    git add Formula/qlik-cli.rb
    echo 'git commit -m "Fix qlik-cli release"'
    git commit -m "Fix qlik-cli release"
    echo "git push"
    git push
    echo "All done."
  fi
}

publish
