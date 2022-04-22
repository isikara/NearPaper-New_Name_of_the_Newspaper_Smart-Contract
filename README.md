<div align="center">
    <h3 align="center">NearPaper - Next Generation Newspaper Project</h3>
</div>

![](images/near-logo.png)

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#intro">Introduction</a>
    </li>
    <li>
      <a href="#infrastructure">Infrastructure</a>
    </li>
    <li>
      <a href="#deploy-usage">Deploy and Usage</a>
    </li>
    <li><a href="#codereview">Code Review</a></li>
  </ol>
</details>

### Intro

Next generation technologies continue to change the definition of many professions. Journalism is absolutely one of them and The NearPaper project is here to rewrite the codes of journalism. The main idea of the NearPaper project is to provide a fully decentralized and independent journalism infrastructure to the ecosystem. NearPaper users call themself pro-consumers that they can read and publish news without limitation of any central authority.

### Infrastructure

NearPaper is built on Near Blockchain. The web interface of the project is under development. Creating integrated applications for mobile users is also at the top of the list of near plans. The NearPaper project continues to be developed by following the nostalgic phenomena of its natural identity and by emporing destrucitive technologies. If you would like to be a part of the NearPaper project; you can clone, recode and play with the code. However, please don't hesitate to reach us. Remember! Legends don't die, they just change shape.

### Deploy-Usage

To deploy the contract for development, follow these steps:

1. clone this repo locally (`git clone https://github.com/isikara/NearPaper-New_Name_of_the_Newspaper_Smart-Contract.git`)
2. run `yarn` to install dependencies (`yarn`)
3. run `yarn build:release` to build your wasm file (`yarn build:release`)
3. run `./build/release/simple.wasm` to deploy the contract (`near dev-deploy ./build/release/simple.wasm`)
4. export `CONTRACT` to the deployed contract name (`export CONTRACT=<Contract-Name>`)
5. check `CONTRACT` veriable (`echo $CONTRACT`)
6. export `OWNER` (`export OWNER=<Your-Account-Name>`)
7. check `OWNER` (`echo $OWNER`)

To use the contract you can do any of the following:

|Name|Type|Details|Functionality|How to Call|
|---|---|---|---|---|
|allNews|PersistentUnorderedMap|public|This class is used to store all news with their id's.|-|
|News|Class|public|This class is state news with its id, newsman and publish date.|-|
|publishNews|Function|public - call function|This function is used to publish a news.|`near call $CONTRACT publishNews '{"text" : "<Your-News>"}' --accountId <Your-Account-Name`|
|bringNews|Function|public - view function|This function is used to get a specific news by using its id.|`near view $CONTRACT bringNews '{"id" : <News-Id>}' --accountId <Your-Account-Name`|
|readNews|Function|public - view function|This function is used to read all news on the contract.|`near view $CONTRACT readNews`|
|deleteNews|Function|public - call function|This function is used to delete a specific news by using its is. Only the account published the news can delete it.|`near call $CONTRACT deleteNews '{"id" : <News-Id>}' --accountId <Your-Account-Name>`|
|sendGratitude|Function|public - call function|This function is used to donate the Newsman by using it account name.|`near call $CONTRACT sendGratitude '{"Newsman" : "<Newsman-Account-Name"}' --amount <Donation-Amount> --accountId <Your-Account_name>`|

### CodeReview

model.ts

```ts
import {context, PersistentUnorderedMap, math, logging } from "near-sdk-as";

export const allNews = new PersistentUnorderedMap<u32, News>("allNews");  

@nearBindgen
export class News {
    id: u32;
    sender: string;
    date: u64;

    constructor(public text: string) {
        this.id = math.hash32<string>(text);
        this.sender = context.sender;
        this.date = context.blockTimestamp;
    }

    static publish(text: string): News {
        const news = new News(text);
        allNews.set(news.id, news);
        return news;
    }

    static bringFromArchieve(id: u32): News {
        return allNews.getSome(id);
    }

    static readANews(): News[] {
        let start: u32 = 0;
        logging.log("You can donate to a Newsman using 'sendGratitude' function!");
        return allNews.values(start, allNews.length);
    }

    static deleteANews(id: u32): void {
        const news = allNews.getSome(id);
        assert(news.sender == context.sender, "It is not your news! First, you need to publish a News to delete it! Use 'publishNews' function");
        allNews.delete(id);
    }
}
```

index.ts

```ts
import { context, ContractPromiseBatch, logging, u128 } from "near-sdk-as";
import { AccountId } from "../../utils";
import { News, allNews } from "./model";

  //Create and Publish a News
export function publishNews(text: string): News {
  logging.log("A scratch to the history of the future!");
  return News.publish(text);
}

  //Take a Look to Archieve
export function bringNews(id: u32): News {
  logging.log("You can send your thanks to the Newsman using 'sendGratitude' function!");
  return News.bringFromArchieve(id);
}

  //Read a News
export function readNews(): News[] {
  assert(allNews.length > 0, "Nothing remarkable happens in these days.");
  return News.readANews();
}

  //Delete your News
export function deleteNews(id: u32): void {
  logging.log("Looking forward to your new news!");
  News.deleteANews(id);
}

  //Donate the Newsman
export function sendGratitude(newsman: AccountId): void {
  assert(context.accountBalance > context.attachedDeposit, "Your balance is not enough!");
  logging.log(`Comolokko! ${context.attachedDeposit.toString()} yoktoNEAR sent`);
  ContractPromiseBatch.create(newsman).transfer(context.attachedDeposit);
}
```
