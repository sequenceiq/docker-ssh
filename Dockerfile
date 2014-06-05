FROM sequenceiq/dnsmasq

ADD install-ssh.sh /tmp/
RUN /tmp/install-ssh.sh

ADD serf /usr/local/serf

CMD /usr/local/serf/bin/start-serf-agent.sh
