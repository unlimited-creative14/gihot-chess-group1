protos: protos/game.proto protos/lobby.proto protos/room.proto protos/signup.proto protos/user_info.proto
	protoc --dart_out=grpc:lib/generated/game -Iprotos protos/game.proto google/protobuf/empty.proto
	protoc --dart_out=grpc:lib/generated/room -Iprotos protos/room.proto google/protobuf/empty.proto
	protoc --dart_out=grpc:lib/generated/lobby -Iprotos protos/lobby.proto 
	protoc --dart_out=grpc:lib/generated/signup -Iprotos protos/signup.proto 
	protoc --dart_out=grpc:lib/generated/userInfo -Iprotos protos/user_info.proto 

clean:
	rm -r lib/generated/game/*
	rm -r lib/generated/lobby/*
	rm -r lib/generated/room/*
	rm -r lib/generated/signup/*
	rm -r lib/generated/userInfo/*

