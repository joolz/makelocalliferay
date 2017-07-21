# makelocalliferay

Some fiddling with Maven to setup versions of apps on a local liferay environment. This should be as hands-free as possible. Things to find out about Maven:

- [x] pass parameter
- [x] echo
- [ ] read multi-line propertyfile, each line containing two values (or another way to pass in value-pairs)
- [ ] execute external commands
- [ ] catch exit code
- [ ] continue or exit depending on exit code
- [ ] scp to local machine
- [ ] parse directory, remove elements depending on name
- [ ] pull Mercurial repository
- [ ] build a specific project
- [ ] copy the resulting artifact

With this environment in place:

- liferay
- a configurationfile containing credentials, paths etc.
- a directory containing specific files
- a speficic file containing one or more lines with on each line a projectname and a branchname

Normal flow of makelocalliferay would be something like this:

- do a mvn compile with parameter YL-1234
- check for existence of file YL-1234.properties. If it exists
- parse the YL-1234.properties
- stop tomcat ...
- ... wait until the shutdown is complete
- get / refresh the default set of war files/ These are built from the tip of the default branches and can be scp'd in
- copy each one of them to liferay/deploy
- for each project in YL-1234.properties
	- remove the warfile from liferay/deploy
	- remove the webapp from tomcat/webapps
	- remove the directory from tomcat/temp
	- remove the directory from tomcat/work
	- in tempdir, pull the project
	- update to the branch specified in YL-1234.properties
	- build
	- copy the artifact to liferay/deploy
- start tomcat
