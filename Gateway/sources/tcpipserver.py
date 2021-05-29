import json
import struct
import math
import time
import random
import socket
import threading
import copy
from sources.base import BaseReader, BaseResultReaderMixin, BaseStreamReaderMixin

WIFI_PORT = ":80"

class TCPServer():
    def __init__(self):
        print("TCP Server create")
        self.started = False
        self.config_line = None
        pass
        
    def start(self, address, port):
        if self.started:
            print("TCP Server already started")
            return
            
        self.address = address
        self.port = port
        
        self.conn_accept_thread = threading.Thread(target = self.conn_accept_thread_func, args=[])
        self.conn_accept_thread.start()
        while self.config_line != None:
            continue
    
    def conn_thread_func(self, conn, addr):
        print("Conn handler {}".format(addr))
        confile = conn.makefile()
        line = ""
        while "\n" not in line:
            bytes = confile.read(1)
            line = line + bytes
            print("bytes {}".format(bytes, type(bytes)))
        #line = confile.readline()
        print("line {}".format(line))
        self.conn = conn
        self.confile = confile
        self.config_line = line
        
    def conn_accept_thread_func(self):    
        print("TCP Server start")
        self.started = True
        try:
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                print("bind {}:{}".format(self.address, self.port))
                s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
                s.bind((self.address, self.port))
                s.listen()
                while True:
                    conn, addr = s.accept()
                    print('Connected by', addr)
                    conn_thread = threading.Thread(target = self.conn_thread_func, args=[conn, addr])
                    conn_thread.start()
                    #self.conn = conn
                    #self.confile = conn.makefile()

        except Exception as e:
            print(e)
            self.disconnect()
            raise e
          
            
tcpServer = TCPServer()

    
class TCPIPServerReader(BaseReader):
    def __init__(self, config, device_id, **kwargs):

        self.device_id = device_id

        if kwargs.get("connect", True) is True:
            self._address = "0.0.0.0"
            self._port = int(device_id)
        
        print("TCP server reader create")
        tcpServer.start(self.address, self.port)
            
        super(TCPIPServerReader, self).__init__(config, device_id, **kwargs)
        

    @property
    def address(self):
        return self._address

    @property
    def port(self):
        return self._port


class TCPIPServerStreamReader(TCPIPServerReader, BaseStreamReaderMixin):
    def read_device_config(self):
        print("read device config")
        while tcpServer.config_line is None:
            continue
        line = tcpServer.config_line
        print(line)
        jsonline = json.loads(line)
        print("jsonline: {}".format(jsonline))
        return self._validate_config(jsonline)

    def _read_source(self):
        print("read sorce")
        try:            
            self.streaming = True            
            while True:
                #line = tcpServer.confile.readline()
                data = tcpServer.conn.recv(self.source_buffer_size)
                print("d:'{}'".format(data))
                if b"CIPSEND" in data:
                   print("garbage filtered out")
                   continue

                self.buffer.update_buffer(data)
                time.sleep(0.0001)

        except Exception as e:
            print(e)
            self.disconnect()
            raise e

    def set_app_config(self, config):
        config["DATA_SOURCE"] = "TCPIPSERVER"
        config["CONFIG_COLUMNS"] = self.config_columns
        config["CONFIG_SAMPLE_RATE"] = self.sample_rate
        config["SOURCE_SAMPLES_PER_PACKET"] = self.source_samples_per_packet
        config["DEVICE_ID"] = self.device_id


class TCPIPServerResultReader(TCPIPServerReader, BaseResultReaderMixin):
    def set_app_config(self, config):
        config["DATA_SOURCE"] = "TCPIPSERVER"
        config["DEVICE_ID"] = self.device_id

    def _read_source(self):
        self.streaming = True

        with s.get(url, headers=None, stream=True) as resp:
            content = ""

            for cont in resp.iter_content():

                if not self.streaming:
                    return

                try:
                    data = cont.decode("ascii")
                except Exception as e:
                    print(e)
                    continue

                if data == "}":
                    content += data
                    self.rbuffer.update_buffer([content])
                    content = ""
                elif data == "{":
                    content = data
                else:
                    content += data


if __name__ == "__main__":
    device_id = "192.168.86.27:80"
    config = {
        "CONFIG_SAMPLES_PER_PACKET": 10,
        "CONFIG_SAMPLE_RATE": 100,
        "CONFIG_COLUMNS": ["X", "Y", "Z"],
    }

    import threading
    import time

    """
    reader =  TCPResultReader(config, device_id)
    """

    reader = TCPIPReader(config, device_id)

    print(reader.read_config())
    # print(reader._read_sensor_data())

    for data in reader.read_data():
        print(data)
