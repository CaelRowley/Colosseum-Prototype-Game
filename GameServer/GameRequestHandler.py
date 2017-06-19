import socketserver
import socket
import threading
import io
import argparse
import select
import queue

class GameRequestHandler(socketserver.BaseRequestHandler):
    def __init__(self, request, client_address, server):
        self.buffer = queue.Queue()
        super().__init__(request, client_address, server)

    def setup(self):
        print("Setting up connection")
        super().setup()
        self.server.add_client(self)
        self.socketRunning = True      

    def handle(self):
        try:
            while self.socketRunning:
                self.data = self.request.recvfrom(1024)
                self.broadcast_message()
                
        except(ConnectionResetError, EOFError):
            self.socketRunning = False
            pass


        
        #while self.socketRunning:
        #    try:
        #        self.data = self.request.recvfrom(1024)
        #        socketMessage = io.BytesIO(self.data[0])
        #        dataFromClient = socketMessage.read()
        #        print(dataFromClient)

        #        response = "hope101"
        #        responseUTF = bytes(response,'utf-8')
        #        self.request.send(responseUTF)
                #self.server.broadcast(self, responseUTF)
        #    except:
        #        self.socketRunning=False
        #    finally:
        #        self.request.close()

    def broadcast_message(self):
        self.server.broadcast(self, self.data[0])

    @property
    def name(self):
        return self.request.connection.getpeername()

    def schedule(self, data):
        self.buffer.put_nowait(data)

    def finish(self):
        print("Finished")
        self.server.remove_client(self)
        super().finish()
