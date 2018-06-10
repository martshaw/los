set -e
set -x

SERVICE_NAME=$1

# Create Git tag from the version number in package.json and push to the origin
git config --global user.email ${EMAIL}
git config --global user.name "Travis CI"
PACKAGE_VERSION=$(node -p -e "require('./package.json').version")
GIT_TAG=v$PACKAGE_VERSION
git tag $GIT_TAG -a -m "Generated tag from TravisCI build $TRAVIS_BUILD_NUMBER"
git remote add deploy https://${GH_TOKEN}@github.com/martshaw/los.git >/dev/null 2>&1
git push origin $GIT_TAG