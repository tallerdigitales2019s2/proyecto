import keyboard  # using module keyboard
import time
import serial
ser = serial.Serial('/dev/ttyUSB0', 115200)
key_p2=0
key_p1=0

while True:  # making a loop
    if keyboard.is_pressed('up'):# if key 'q' is pressed 
        key_p1=1
        print('up')
    elif keyboard.is_pressed('down'):
        key_p1=2
        print('down')
    elif keyboard.is_pressed('right'):
        key_p1=3
        print('right')
    elif keyboard.is_pressed('left'):
        key_p1=4
        print('left')
    elif keyboard.is_pressed('enter'):
        key_p1=5
        print('enter')
    else:
        key_p1=0
    ser.write(chr(key_p1).encode())
    
    if keyboard.is_pressed('w'):# if key 'q' is pressed 
        key_p2=1|128
        print('up')
    elif keyboard.is_pressed('s'):
        key_p2=2|128
        print('down')
    elif keyboard.is_pressed('d'):
        key_p2=3|128
        print('right')
    elif keyboard.is_pressed('a'):
        key_p2=4|128
        print('left')
    elif keyboard.is_pressed('space'):
        key_p2=5|128
        print('enter')
    else:
        key_p2=0|128
    ser.write(chr(key_p2).encode())
    
    time.sleep(0.1)
    

    
