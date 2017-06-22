# python D:\Python\GameServer\runGameServer.py

import threading
from GameRequestHandler import *
from GameCustomServer import *

if __name__ == "__main__":
    HOST = "000.000.000.000"
    PORT = 8003
    server = GameCustomServer((HOST,PORT), GameRequestHandler)
    server.allow_reuse_address = True
    #server.socket.setblocking(False)

    server_thread = threading.Thread(target=server.serve_forever())
    server_thread.daemon = True
    server_thread.start()

    #print("Server Running: ", server_thread.name)
    #server.serve_forever()
