protos: protos/roomServices.proto protos/game.proto
	protoc --dart_out=grpc:lib/generated/room -Iprotos protos/roomServices.proto
	protoc --dart_out=grpc:lib/generated/game -Iprotos protos/game.proto google/protobuf/empty.proto

clean:
	rm -r ./lib/generated/game/*.dart
	rm -r ./lib/generated/chat/*.dart
	rm -r ./lib/generated/room/*.dart
