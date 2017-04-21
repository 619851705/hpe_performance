
all: target/lib/dsdgen.jar target/tpcds-gen-1.0-SNAPSHOT.jar

target/tpcds-gen-1.0-SNAPSHOT.jar: $(shell find -name *.java) 
	mvn package

target/v2.3.0.p3.zip: v2.3.0.p3.zip
	mkdir -p target/
	cp v2.3.0.p3.zip target/v2.3.0.p3.zip

#v2.3.0.p3.zip:
#	curl --output tpcds_kit.zip http://www.tpc.org/tpcds/dsgen/dsgen-download-files.asp?download_key=NaN

target/lib/dsdgen.jar: target/tools/dsdgen
	cd target/; mkdir -p lib/; ( jar cvf lib/dsdgen.jar tools/ || gjar cvf lib/dsdgen.jar tools/ )

target/tools/dsdgen: target/v2.3.0.p3.zip
	test -d target/tools/ || (cd target; unzip v2.3.0.p3.zip)
	test -d target/tools/ || (cd target; mv v2.3.0.p3/tools tools)
	cd target/tools; cat ../../patches/all/*.patch | patch -p0
	cd target/tools; cat ../../patches/${MYOS}/*.patch | patch -p1
	cd target/tools; make clean; make dsdgen

clean:
	mvn clean
