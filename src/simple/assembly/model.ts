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