protos: protos/roomServices.proto
	protoc --dart_out=grpc:lib/generated -Iprotos protos/roomServices.proto

clean:
	rm -r ./lib/generated/*.dart