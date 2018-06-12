echo "Found Unit test projects:"
find $APPCENTER_SOURCE_DIRECTORY-regex '.*UnitTests.*\.csproj' -exec echo {} \;

echo
echo "Building Unit test projects:"
Find $APPCENTER_SOURCE_DIRECTORY -regex '.*UnitTests.*\.csproj' -exec msbuild {} \;

echo
echo "Compiledprojects to run Unit tests:"
find $APPCENTER_SOURCE_DIRECTORY -regex '.*bin.*UnitTests.*\.dll' -exec echo {} \;

echo
echo "Running Unit tests:"
find $APPCENTER_SOURCE_DIRECTORY -regex '.*bin.*UnitTests.*\.dll' -exec dotnet vstest --logger:trx {} \;

 echo
find $APPCENTER_SOURCE_DIRECTORY/UnitTests/TestResults -name '*.trx' -exec cat {} \;