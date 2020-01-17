docker build -f docker\latest\Dockerfile -t groupdocsassemblycloudruby:latest .
docker run --rm -it -v %cd%:/opt/project -w="/opt/project" groupdocsassemblycloudruby:latest /bin/bash test.sh