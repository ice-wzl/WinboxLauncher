FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV WINEARCH=win32
ENV WINEPREFIX=/wine
ENV WINEDLLOVERRIDES="mshtml,mscoree="

RUN apt-get update && apt-get install -y \
    wine \
    python3 \
    python3-pip \
    unzip \
    libegl1 \
    libgl1 \
    libnss3 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcb-glx0 \
    libxcb-util1 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-render0 \
    libxcb-shm0 \
    libxcb-shape0 \
    libxcb-sync1 \
    libxcb-xfixes0 \
    libxcb-xkb1 \
    libxkbcommon0 \
    libxkbcommon-x11-0 \
    libxrender1 \
    libxrandr2 \
    libxi6 \
    libxtst6 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxfixes3 \
    libxss1 \
    libxau6 \
    libxdmcp6 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgtk-3-0 \
    libfreetype6 \
    libfontconfig1 \
    libbz2-1.0 \
    libpng16-16 \
    libexpat1 \
    libbrotli1 \
    libxcb-icccm4 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*


RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y wine wine32 libwine:i386 libncurses6:i386 libstdc++6:i386 winbind

RUN wineboot --init || true

# Required for Winbox4.x
RUN mkdir -p "/wine/drive_c/users/root/Application Data/MikroTik/WinBox"

# Create app directory
WORKDIR /app

# Copy files
COPY winbox/ /app/winbox/
COPY start.py /app/start.py

# Set wine prefix (optional customization)
ENV WINEPREFIX=/wine

# Entrypoint to the Python launcher
ENTRYPOINT ["python3", "start.py"]

