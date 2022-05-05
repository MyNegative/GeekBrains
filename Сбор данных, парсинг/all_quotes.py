import scrapy
from scrapy.linkextractors import LinkExtractor
from scrapy.spiders import CrawlSpider, Rule


class AllQuotesSpider(CrawlSpider):
    name = 'all_quotes'
    allowed_domains = ['quotes.toscrape.com']
    start_urls = ['https://quotes.toscrape.com/']

    rules = (
        Rule(LinkExtractor(restrict_xpaths='.//li[@class="next"]/a'), callback='parse_start_url', follow=True),
    )

    def parse_start_url(self, response):
        quotes = response.xpath('//div[@class="quote"]')
        for quote in quotes:
            bio_url = quote.xpath('.//span/a/@href').get()
            item = {'author': quote.xpath('.//span/small/text()').get(),
                    'quote': quote.xpath('.//span[@class="text"]/text()').get(),
                    'tags': quote.xpath('.//div[@class="tags"]/meta/@content').get().split(',')
                    }
            yield response.follow(bio_url, self.parse_bio, meta={'item': item}, dont_filter=True)

    def parse_bio(self, response):
        item = response.meta['item']
        item['born'] = response.xpath('//div[@class="author-details"]/p/span[@class="author-born-date"]/text()').get()
        item['bio'] = response.xpath('//div[@class="author-details"]/div[@class="author-description"]/text()').get().strip()

        return item