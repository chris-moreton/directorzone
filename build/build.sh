
REPO=directorzone
DOMAIN=directorzone.local
LIVE_URL=http://directorzone.local
TEST_URL=http://test.directorzone.local

#################################################################################
echo "Stamping build"
#################################################################################

echo $1 > build_number.txt
echo $2 > build_time.txt

#################################################################################
echo "Tarring source"
#################################################################################

cd ..
rm source.tar.gz
tar -zcf source.tar.gz ./*

#################################################################################
echo "Sending source to test site"
#################################################################################

scp -i /var/lib/jenkins/.ssh/id_rsa source.tar.gz jenkins@$DOMAIN:/var/www/test.$REPO

rc=$?
if [ $rc != 0 ] ; then
    exit $rc
fi

#################################################################################
echo "Untarring source on remote test site"
#################################################################################

ssh -i /var/lib/jenkins/.ssh/id_rsa jenkins@$DOMAIN "cd /var/www/test.$REPO && tar -zxf source.tar.gz"

#################################################################################
echo "Running Selenium test on test server"
#################################################################################

runSelenium($TEST_URL)

#################################################################################
echo "Sending source to live site"
#################################################################################

scp -i /var/lib/jenkins/.ssh/id_rsa source.tar.gz jenkins@$DOMAIN:/var/www/$REPO

rc=$?
if [ $rc != 0 ] ; then
    exit $rc
fi

#################################################################################
echo "Untarring source on live site"
#################################################################################

ssh -i /var/lib/jenkins/.ssh/id_rsa jenkins@$DOMAIN "cd /var/www/$REPO && tar -zxf source.tar.gz"

#################################################################################
echo "Running Selenium test on live server"
#################################################################################
	
runSelenium($LIVE_URL)

#################################################################################
echo "Done"
#################################################################################

function runSelenium() 
{
	#################################################################################
	echo "Killing any old displays"
	#################################################################################
	
	rm /tmp/.X10-lock
	fuser -k 6010/tcp
	fuser -k 4444/tcp
	
	#################################################################################
	echo "Initiating display"
	#################################################################################
	
	Xvfb :10 -ac &
	export DISPLAY=:10
	
	#################################################################################
	echo "Running Selenium suite"
	#################################################################################
	cd build/selenium
	java -jar /usr/bin/selenium-server.jar -multiwindow -htmlSuite "*firefox" "$1" "suite.html" "report.html"
	
	if grep '<td>passed</td>' report.html
	then
	    exit 0
	else
	    exit 1
	fi
}
