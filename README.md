# AWS Dangling Domains
Dangling Domains in AWS script for exploitation

This was written by dafthack/aws-dangling-domain-discovery-tool.sh but was not working because BING updated its endpoints. Also I added some enhacements to the code. Like the last commented line, with that you can release your IPs manually if needed. 

### To run it you will need

* [AWS CLI](https://aws.amazon.com/cli/) 
* AWS profile that will let you allocate/deallocate IPs
* [Azure cognito Bing search api](https://azure.microsoft.com/en-us/services/cognitive-services/bing-web-search-api/) 
  * Go to azure cognitive service
  * Clikc on Create
  * Search for Bing Search v7
  * Create a key (ideally a free one)



## Running it is as simple as

```sh
aws configure
# put your keys aws 
chmod +x AWS-Dangling-Domains.sh
./dangRic.sh
```


# Risks

Having a subdomain nets you a lot of implicit trust. For example, you could use your newly obtained subdomain to carry out powerful phishing attacks against the organization that owns the base domain. This is possible because you can send and receive email from the subdomain as well as host content on it. After all, why wouldn't employees trust a subdomain that appears to belong to their company?

Having a subdomain is also useful for exploiting a company. If a website incorrectly scopes their cookies to all subdomains, you can hijack user sessions. This was the case with Origin, which scopes all of its cookies so that the subdomains of Origin.com can also read them. This means that we could send the link to the subdomain we took over (qa.oms.origin.com) to any logged-in Origin users and take full control over their account.

Do they have a crossdomain.xml policy? It probably allows all subdomains (as demonstrated in our recent Black Hat talk). You can then use Flash to hijack their account and steal sensitive account information. For example, if a financial institution made any of these mistakes, you could steal customer financial information or send money from a customer's account.

The greater issue exposed by this attack is the challenge of trusting ephemeral resources. Organizations need to stay vigilant of who and what they are trusting, as things like cloud instances are subject to change. When that change happens, the trust placed in that asset could be reacquired by an attacker.

read more  [here](https://labs.bishopfox.com/tech-blog/2015/10/fishing-the-aws-ip-pool-for-dangling-domains) 

### Results will look like this 

<img width="885" alt="Screen Shot 2020-10-31 at 10 25 33" src="https://user-images.githubusercontent.com/73739470/97777745-86fecf80-1b72-11eb-830d-aa12a8874478.png">

(beautified version)

<img width="1342" alt="Screen Shot 2020-10-31 at 10 34 03" src="https://user-images.githubusercontent.com/73739470/97777749-8b2aed00-1b72-11eb-9d4c-ce5892137784.png">
