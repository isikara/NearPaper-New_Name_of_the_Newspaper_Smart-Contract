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
  assert(allNews.length > 0, "Nothing remarkable is happened in the universe.");
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