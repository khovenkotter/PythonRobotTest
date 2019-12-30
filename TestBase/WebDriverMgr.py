import selenium
from selenium.webdriver.chrome import webdriver


class WebDriverMgr(object):
    __driver = None

    @classmethod
    def get_web_driver(cls, browser):
        if cls.__driver is None:
            if (browser.lower()) == "chrome":
                cls.__driver = webdriver.Chrome("E:\Selenium_WebDrivers\Chrome\79\chromedriver_win32\chromedriver.exe")

            return cls.__driver