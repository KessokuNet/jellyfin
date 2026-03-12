FROM debian:bookworm
# timezone
RUN apt update && apt install -y tzdata; \
    apt clean;

    # sshd
RUN mkdir /var/run/sshd; \
    apt install -y openssh-server; \
    apt clean;
    
COPY sshd_config /etc/ssh/sshd_config

RUN apt update && apt install -y ffmpeg; \
    apt clean;

ADD "https://github.com/jellyfin/jellyfin-ffmpeg/releases/download/v7.1.3-3/jellyfin-ffmpeg7_7.1.3-3-bookworm_amd64.deb" \
    /var/jellyfin-ffmpeg.deb

RUN dpkg -i /var/jellyfin-ffmpeg.deb;


ENV TZ=Asia/Bangkok
COPY entrypoint.sh /usr/local/bin/entry_point.sh
RUN chmod +x /usr/local/bin/entry_point.sh


EXPOSE 22

ENTRYPOINT ["entry_point.sh"]
CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]
