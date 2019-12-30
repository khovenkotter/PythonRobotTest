from PythonRobotTest.TestBase.Web import Web


class ClarityPage(object):

    __url = "https://clarity.dexcom.com/"


    def open(self):
        self._web.open(self.__url)

    def __init__(self, browser):
        self._web = Web(browser)

    def select_home_user(self):
        self._web.get_web_element_by_xpath("xpath:/html/body/div[1]/div[1]/div/div[2]/div/nav/ul/li[1]/div/a").click()

    def input_username(self, username=None):
        self._web.get_web_element_by_id("username").sendkeys(username)

    def input_password(self, password=None):
        self._web.get_web_element_by_id("password").sendkeys(password)

    def select_login(self):
        self._web.get_web_selement_by_css("#edit-actions > input").click()

    def close(self):
        self._web.close_all()