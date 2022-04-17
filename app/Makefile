.PHONY: dart-proto protoc protoc-gen-dart
all: dart-proto

PROTOC=${HOME}/.local/bin/protoc
PROTOC_GEN_DART=${HOME}/.pub-cache/bin/protoc-gen-dart
PROTO_FILES := $(shell find ../server/proto/src/ -type f -name \*.proto) 

# Compile protobuf files to Dart
dart-proto: lib/components/proto/items.pb.dart
lib/components/proto/items.pb.dart: protoc protoc-gen-dart
	mkdir -p lib/proto
	rm -rf lib/proto/*.dart
	${PROTOC} -I=../server/proto/src/ --dart_out=lib/proto/ ${PROTO_FILES} --plugin=${PROTOC_GEN_DART}

# Install protoc
protoc: ${HOME}/.local/bin/protoc
${HOME}/.local/bin/protoc:
	rm -rf /tmp/squeue-protoc
	mkdir -p /tmp/squeue-protoc
	wget https://github.com/protocolbuffers/protobuf/releases/download/v3.19.4/protoc-3.19.4-linux-x86_64.zip -O /tmp/squeue-protoc/protoc.zip
	unzip /tmp/squeue-protoc/protoc.zip -d /tmp/squeue-protoc/
	
	mkdir -p ${HOME}/.local/bin/
	mv /tmp/squeue-protoc/bin/protoc ${HOME}/.local/bin
	rm -rf /tmp/squeue-protoc

# Install the protoc-gen-dart plugin
protoc-gen-dart: ${HOME}/.pub-cache/bin/protoc-gen-dart
${HOME}/.pub-cache/bin/protoc-gen-dart:
	pub global activate protoc_plugin