import socketserver
import socket
import threading
import io
import argparse
import select
import queue

class GameCustomServer(socketserver.ThreadingTCPServer):
    def __init__(self, server_address, request_handler_class):
        super().__init__(server_address, request_handler_class, True)
        self.clients = set()

    def add_client(self, client):
        self.clients.add(client)
        print("added client")

    def broadcast(self, source, data):
        for client in tuple(self.clients):
            #if client is not source:
            #print(data)
            #client.schedule((source, data))
            #print(data)
            
            #client_ip = bytes(source.client_address[0], 'utf-8')
            #client_ip.extend(source.client_address[0])
            #data.append(client_ip)
            #print(client_ip)
            #fullarray = bytes()
            #fullarray.join([client_ip])
            #fullarray+=data
            #fullarray+=client_ip

            #print(fullarray)
            #data += client_ip
            client.request.send(data)
            #client.request.send(bytes('active','utf-8'))
            
            

    def remove_client(self, client):
        self.clients.remove(client)
        print("Removed client")
