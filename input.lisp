;; Load packages
(load "packages.lisp" :external-format :utf-8)

(in-package :cl-cffi)

;; Load wrapper API
(load "libwiringPi.lisp" :external-format :utf-8)

;; Define GPIO11(pin 23) with the name "+pin+"
(defconstant +pin+ 17)

(defun digi-input ()
  ;; Initialize GPIO
  (wiringPiSetupGpio)
  
  ;; Set GPIO11 to input mode
  (pinMode +pin+ 0)

  ;; Read the status of the GPIO pin
  (pullUpDnControl +pin+ 2)

  ;; Infinite loop: "Ctrl-c" to exit the loop
  (loop
   (if (equal (digitalRead +pin+) 0)
     (format t "Switch ON~%")
     (format t "Switch OFF~%"))
   (delay 500)))

;; digi-input execution
(digi-input)
