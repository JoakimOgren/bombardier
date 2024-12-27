"c:\Program Files\Go\bin\go.exe" get -u all
"c:\Program Files\Go\bin\go.exe" mod tidy
"c:\Program Files\Go\bin\go.exe" test
set GOARCH=amd64
set CGO_ENABLED=0
set GOOS=linux
"c:\Program Files\Go\bin\go.exe" build -trimpath -ldflags "-s -w -X main.version=1.2.6-joakim"
set GOOS=windows
"c:\Program Files\Go\bin\go.exe" build -trimpath -ldflags "-s -w -X main.version=1.2.6-joakim"
