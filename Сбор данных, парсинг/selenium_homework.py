import time
import json
from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as ec

service = Service('./geckodriver.exe')
driver = webdriver.Firefox(service=service)

# Авторизация
driver.get('https://quotes.toscrape.com/login')
WebDriverWait(driver, 30).until(ec.presence_of_element_located((By.XPATH, '//form')))

username = driver.find_element(by=By.ID, value='username')
password = driver.find_element(by=By.ID, value='password')

username.send_keys('admin')
password.send_keys('admin')

button = driver.find_element(by=By.XPATH, value='//input[@value="Login"]')
button.click()

# Бесконечный скролл
driver.get('https://quotes.toscrape.com/scroll')
WebDriverWait(driver, 30).until(ec.presence_of_element_located((By.XPATH, '//div[@class="quote"]')))

pause = 1
start_height = driver.execute_script('return document.body.scrollHeight')

while True:
    driver.execute_script('window.scrollTo(0, document.body.scrollHeight)')
    time.sleep(pause)

    new_height = driver.execute_script('return document.body.scrollHeight')
    if new_height == start_height:
        break
    start_height = new_height

authors = driver.find_elements(by=By.XPATH, value='//small[@class="author"]')
quotes = driver.find_elements(by=By.XPATH, value='//span[@class="text"]')
tags = driver.find_elements(by=By.XPATH, value='//div[@class="tags"]')

all_quotes = []

for author, quote, tag in zip(authors, quotes, tags):
    content = {'Author': author.text, 'Quote': quote.text,
               'Tags': tag.text.replace('Tags: ', '').replace('Tags:', '').split(' ')}
    all_quotes.append(content)

with open('quotes.json', 'w') as jf:
    json.dump(all_quotes, jf)

driver.quit()