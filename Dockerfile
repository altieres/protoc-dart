FROM dart:stable

WORKDIR /work

RUN apt-get update -qq && apt-get install -y protobuf-compiler && rm -rf /var/lib/apt/lists/*

RUN dart pub global activate protoc_plugin

ENV PATH=$PATH:/root/.pub-cache/bin

COPY sale.proto /work/

RUN protoc --dart_out=grpc:. -I. *.proto
