.PHONY: all

deps:
	go get -u ./...

clean: 
	rm -rf ./hello-world/hello-world

build:
	GOOS=linux GOARCH=amd64 go build -o hello-world/hello-world ./hello-world
    GOOS=linux GOARCH=amd64 go build -o hello-world/hello-world ./hello-world
    GOOS=linux GOARCH=amd64 go build -o score-register/score-register ./score-register
	# 複数の lambda を用意するときは、ここに追加していく

deploy:
    sam deploy --template-file output-template.yaml --stack-name sam-template-store --capabilities CAPABILITY_IAM --profile toriumin
