FROM debian:bookworm
# timezone
LABEL org.opencontainers.image.source="https://github.com/KessokuNet/jellyfin"
LABEL org.opencontainers.image.description="KessokuNet Jellyfin Patches"
LABEL org.opencontainers.image.licenses="Unlicense"

RUN apt update && \
    apt install -y unzip ffmpeg &&\
    rm -rf /var/lib/apt/lists/* && \
    apt autoremove --purge -y && \
    apt clean

ADD "https://github.com/steelbrain/ffmpeg-over-ip/releases/download/v5.0.0/linux-amd64-ffmpeg-over-ip-server.zip" \
    /var/ffmpeg-over-ip-server.zip


RUN mkdir -p /opt/ffmpeg-over-ip && \
    unzip /var/ffmpeg-over-ip-server.zip -d /opt/ffmpeg-over-ip/
ENV FFMPEG_OVER_IP_SERVER_CONFIG=/usr/local/etc/ffmpeg-over-ip.server.jsonc
# COPY ./rffmpeg.yml /etc/rffmpeg/rffmpeg.yml
ENTRYPOINT [ "/opt/ffmpeg-over-ip/ffmpeg-over-ip-server" ]
