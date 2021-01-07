import accounts
import alpaca_trade_api as tradeapi
class stock:
    def __init__(self, ticker):
        database = accounts.access_db()
        stock_db = database.sheet1
        for stock_in_db in stock_db.get_all_records():
            if stock_in_db['Ticker'] == ticker:
                stock_dict = stock_in_db
                break
        self.ticker = ticker
        self.price = stock_dict['Price']
        self.position = stock_dict['Position']

class user:
    def __init__(self, username):
        database = accounts.access_db()
        user_db = database.sheet2
        for user_in_db in user_db.get_all_records():
            if user_in_db['Username'] == username:
                userf_dict = user_in_db
                break
        self.username = username
        self.accuracy = user_dict['Accuracy']

def update_db():
    return 0
    #check market hours 
    #go through each stock in the database
    #match price to alpaca 
    #update stock price for each ticker 
    #iterate through stocks in database
