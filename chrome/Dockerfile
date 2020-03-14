FROM jess/chrome

USER root

RUN apt-get update && apt-get install -y libnss3-tools
COPY chrome-with-CAs.sh /usr/local/bin/chrome-with-CAs.sh

ENV CA_FILE=/home/chrome/CA.pem
ENV CA_NAME="User CA"

USER chrome

ENTRYPOINT [ "chrome-with-CAs.sh" ]