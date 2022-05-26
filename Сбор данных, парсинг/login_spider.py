import scrapy


class LoginSpiderSpider(scrapy.Spider):
    name = 'login_spider'
    allowed_domains = ['quotes.toscrape.com']
    start_urls = ['https://quotes.toscrape.com/login']

    def parse(self, response):
        csrf_token = response.xpath('//input[@name="csrf_token"]/@value').get()
        yield scrapy.FormRequest.from_response(
            response,
            formxpath='//form',
            formdata={
                'csrf_token': csrf_token,
                'username': 'admin',
                'password': 'admin',
            },
            callback=self.parse_quotes
        )

    def parse_quotes(self, response):
        quotes = response.xpath('//div[@class="quote"]')
        for quote in quotes:
            yield {
                'author': quote.xpath('.//span/small/text()').get(),
                'quote': quote.xpath('.//span[@class="text"]/text()').get()
            }