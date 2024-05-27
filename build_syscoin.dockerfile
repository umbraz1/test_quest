FROM ubuntu:20.04


RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libtool \
    pkg-config \
    python3 \
    python3-pip \
    python3-dev \
    libzmq3-dev \
    libsodium-dev \
    libssl-dev \
    wget \
    curl \
    libgdiplus \
    libcairo2-dev \
    libpng-dev \
    libjpeg-dev \
    libtiff-dev \
    libicu-dev \
    libxml2-dev \
    libxslt1-dev \
    autoconf \
    automake \
    libtool \
    g++ \
    libpq-dev \
    libncurses5-dev


RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt


WORKDIR /app
COPY . .
RUN git submodule update --init --recursive


RUN cmake -B build -DCMAKE_BUILD_TYPE=Release \
  -DSYSCOIN_ENABLE_WALLET=ON \
  -DSYSCOIN_ENABLE_ZMQ=ON \
  -DSYSCOIN_ENABLE_UPNP=ON \
  -DSYSCOIN_ENABLE_BERKELEYDB=ON \
  -DSYSCOIN_ENABLE_QT=ON \
  -DSYSCOIN_ENABLE_TESTS=ON \
  -DSYSCOIN_ENABLE_BENCH=ON \
  -DSYSCOIN_ENABLE_WIN32=OFF

RUN cmake --build build --target all


COPY syscoin.conf /app/build/src/
COPY data /app/build/src/


EXPOSE 14200
EXPOSE 8333


CMD ["build/src/syscoind"]