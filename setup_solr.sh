#!/bin/sh
#
# Install Solr 7.2 on OSX for local or development purpose
# Author: Pierre-Julien Mazenot
#
# Run as sudo `./solr-7.2-install-osx.sh`
#

# cd to the /opt dir
cd /opt/

# Download the last release of Solr
curl -O http://www-us.apache.org/dist/lucene/solr/7.2.0/solr-7.2.0.tgz

# Extract and remove the archive
tar zxf solr-7.2.0.tgz && rm solr-7.2.0.tgz

# Create the symlink
ln -s solr-7.2.0/ solr

# Start the Solr (Local or development mode only)
# This produce the following warning
# WARNING: Starting Solr as the root user is a security risk and not considered best practice. Exiting.
#         Please consult the Reference Guide. To override this check, start with argument '-force'
# In production we create the user and group solr and give the permissions on the /opt/solr* dirs then
# run `/opt/solr/bin/solr start` as the solr user.
/opt/solr/bin/solr start -force

