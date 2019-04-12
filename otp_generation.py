import random
import datetime as dt

def otpgenerate():
    rn=random.randint(100000,1000000)
    timeinfo=str(dt.datetime.now().strftime( "%H:%M:%S"))
    return rn,timeinfo