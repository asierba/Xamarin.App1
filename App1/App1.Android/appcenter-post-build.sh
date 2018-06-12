echo "Found Unit test projects:"
find $APPCENTER_SOURCE_DIRECTORY-regex '.*UnitTests.*\.csproj' -exec echo {} \;

echo
echo "Building Unit test projects:"
Find $APPCENTER_SOURCE_DIRECTORY -regex '.*UnitTests.*\.csproj' -exec msbuild {} \;

echo
echo "Compiled projects to run Unit tests:"
find $APPCENTER_SOURCE_DIRECTORY -regex '.*bin.*UnitTests.*\.dll' -exec echo {} \;

echo
echo "Running Unit tests:"
find $APPCENTER_SOURCE_DIRECTORY -regex '.*bin.*UnitTests.*\.dll' -exec dotnet vstest --logger:trx {} \;

 echo
find $APPCENTER_SOURCE_DIRECTORY/App1/App1.Android/TestResults -name '*.trx' -exec cat {} \;

echo
pathOfTestResults=$(find $APPCENTER_SOURCE_DIRECTORY/App1/App1.Android/TestResults -name '*.trx')


#look for a failing test, if test failed make test build failed
grep -q 'outcome="Failed"' $pathOfTestResults

if [[ $? -eq 0 ]]
then
    echo "A test Failed" 
    exit 1
else 
    echo "all tests passed" 
fi