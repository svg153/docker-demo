FROM ubuntu:18.04

ENV HTTP_PROXY http://proxy.com:80/
ENV HTTPS_PROXY http://proxy.com:80/
ENV http_proxy http://proxy.com:80/
ENV https_proxy http://proxy.com:80/

# RUN apt-get update
# RUN apt-get install -y -q wget
# RUN apt-get install -y -q gcc
# RUN apt-get install -y -q libexpat-dev
# RUN apt-get install -y -q make


RUN apt-get update && \
    apt-get install -y -q wget gcc libexpat-dev make




# RUN wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/rough-auditing-tool-for-security/rats-2.4.tgz
# RUN tar -xzvf rats-2.4.tgz
# # RUN cd rats-2.4
# WORKDIR /rats-2.4
# RUN ./configure
# RUN make
# RUN make install




RUN apt-get install -y -q git

# RUN git clone https://github.com/thesp0nge/rough-auditing-tool-for-security.git /rats-2.4
# WORKDIR /rats-2.4
# RUN ./configure
# RUN make
# RUN make install

RUN git clone https://github.com/thesp0nge/rough-auditing-tool-for-security.git /rats-2.4 && \
    cd /rats-2.4 && \
    ./configure && \
    make && \
    make install



CMD rats --help