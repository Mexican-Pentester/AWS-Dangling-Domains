# AWS-Dangling-Domains
Dangling Domains in AWS script for exploitation

This was written by dafthack/aws-dangling-domain-discovery-tool.sh but was not working because BING updated its endpoints. 
+ I added some enhacements to the code. Like the last commented line, with that you can release your IPs manually if needed. 

### To run it you will need

* [AWS CLI](https://aws.amazon.com/cli/) 
* AWS profile that will let you allocate/deallocate IPs
* [Azure cognito Bing search api](https://azure.microsoft.com/en-us/services/cognitive-services/bing-web-search-api/) 
  * Go to azure cognitive service
  * Clikc on Create
  * Search for Bing Search v7
  * Create a key (ideally a free one)



Running it is as simple as

```sh
aws configure
# put your keys aws 
chmod +x dangRic.sh
./dangRic.sh
```

### Results will look like this 

<img width="885" alt="Screen Shot 2020-10-31 at 10 25 33" src="https://user-images.githubusercontent.com/73739470/97777745-86fecf80-1b72-11eb-830d-aa12a8874478.png">

(beautified version)

<img width="1342" alt="Screen Shot 2020-10-31 at 10 34 03" src="https://user-images.githubusercontent.com/73739470/97777749-8b2aed00-1b72-11eb-9d4c-ce5892137784.png">
