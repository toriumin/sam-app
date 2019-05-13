.PHONY: all

deps:
	go get -u ./...

clean: 
	rm -rf ./hello-world/hello-world

build:
	GOOS=linux GOARCH=amd64 go build -o hello-world/hello-world ./hello-world
	GOOS=linux GOARCH=amd64 go build -o score-register/score-register ./score-register


packege:
	sam package --template-file sam-app/template.yaml --output-template-file sam-app/output-template.yaml --s3-bucket template-store --profile toriumin

deploy:
	sam deploy --template-file sam-app/output-template.yaml --stack-name go-lambda --capabilities CAPABILITY_IAM --profile toriumin
