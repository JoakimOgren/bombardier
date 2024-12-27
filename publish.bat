set GO_PATH="C:\Program Files\Go\bin\go.exe"
%GO_PATH% get -u all
%GO_PATH% mod tidy
%GO_PATH% test
set GOARCH=amd64
set CGO_ENABLED=0
set GOOS=linux
%GO_PATH% build -o bombardier-%GOOS%-%GOARCH% -trimpath -ldflags "-s -w -X main.version=1.2.6-joakim"
set GOOS=windows
%GO_PATH% build -o bombardier-%GOOS%-%GOARCH%.exe -trimpath -ldflags "-s -w -X main.version=1.2.6-joakim"
