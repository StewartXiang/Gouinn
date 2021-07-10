import os 
import socket
import win32gui

def set_img_as_wallpaper(file_path):
    file_path = os.path.abspath(file_path)
    win32gui.SystemParametersInfo(20, file_path, 3)

if __name__ == "__main__":
    file_path = "./theme.bmp"  # 图片文件的的路径

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s: #流式 TCP
        s.bind(("0.0.0.0", 8096))
        s.listen()
        c, addr = s.accept()
        with c:
            print(addr, "connected.")
            
            while True:
                data = c.recv(1024) # 数据最大长度 1024
                if data.decode(encoding="utf-8") == "SetWallpaper":
                    set_img_as_wallpaper(file_path)
                    break
                


    

