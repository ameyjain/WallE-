import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

pin = 18
state = GPIO.input(pin)
GPIO.setup(pin, GPIO.OUT)

if (!state):
    GPIO.output(pin, GPIO.HIGH)
    print ("ON")
else:
    GPIO.output(pin, GPIO.LOW)
    print ("OFF")

