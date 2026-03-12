FROM ghcr.io/jpvenson/jellyfin.pgsql:10.11.6-1

LABEL org.opencontainers.image.source="https://github.com/KessokuNet/jellyfin"
LABEL org.opencontainers.image.description="KessokuNet Jellyfin Patches"
LABEL org.opencontainers.image.licenses="Unlicense"

RUN apt update && \
    apt install -y unzip &&\
    rm -rf /var/lib/apt/lists/* && \
    apt autoremove --purge -y && \
    apt clean

ADD "https://github.com/steelbrain/ffmpeg-over-ip/releases/download/v5.0.0/linux-amd64-ffmpeg-over-ip-client.zip" \
    /var/ffmpeg-over-ip-client.zip


RUN unzip /var/ffmpeg-over-ip-client.zip -d /tmp/ && \
    mv /tmp/ffmpeg-over-ip-client /usr/local/bin/ffmpeg-over-ip-client && \
    chmod +x /usr/local/bin/ffmpeg-over-ip-client && \
    ln -s /usr/local/bin/ffmpeg-over-ip-client /usr/local/bin/ffmpeg && \
    ln -s /usr/local/bin/ffmpeg-over-ip-client /usr/local/bin/ffprobe && \
    rm -rf /var/ffmpeg-over-ip-client.zip /tmp/ffmpeg-over-ip-client

# COPY ./rffmpeg.yml /etc/rffmpeg/rffmpeg.yml
ENV JELLYFIN_FFMPEG=/usr/local/bin/ffmpeg
ENV FFMPEG_OVER_IP_CLIENT_CONFIG=/config/ffmpeg-over-ip-client.jsonc

ENTRYPOINT ["./jellyfin/jellyfin"]
