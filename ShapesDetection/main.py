import numpy as np
import cv2 as cv
import sys

if len(sys.argv) <= 1:
    print("Missing argument for picture") 
    exit()

input_image = cv.imread(sys.argv[1])

cascade = cv.CascadeClassifier('./train/out/cascade.xml')

input_image_gray = cv.cvtColor(input_image, cv.COLOR_BGR2GRAY)

#detected_shapes = cascade.detectMultiScale(input_image_gray, 1.3, 5)
detected_shapes = cascade.detectMultiScale(input_image_gray, 1.1, 5)

print(str(len(detected_shapes)) + " shapes detected")

for (x, y, w, h) in detected_shapes:
    cv.rectangle(input_image, (x, y), (x+w, y+h), (255, 0, 0), 2)
    roi_gray = input_image_gray[y:y+h, x:x+w]
    roi_color = input_image[y:y+h, x:x+w]


cv.imshow('img', input_image)
cv.waitKey(0)
cv.destroyAllWindows()
