DATASET=${1:-allCountries}

echo "Downloading Geonames ${DATASET}..."
wget http://download.geonames.org/export/dump/${DATASET}.zip 
echo "Unpacking Geonames ${DATASET}..."
unzip ${DATASET}.zip

echo "Loading gazetteer into Elasticsearch..."
python geonames_elasticsearch_loader.py ${DATASET}

rm ${DATASET}.zip ${DATASET}.txt readme.txt
echo "Done"
