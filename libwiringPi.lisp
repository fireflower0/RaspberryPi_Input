(define-foreign-library libwiringPi
  (:unix "libwiringPi.so"))

(use-foreign-library libwiringPi)

;; Initialization of the wiringPi
(defcfun "wiringPiSetupGpio" :int)

;; Set the mode of the GPIO pin
(defcfun "pinMode" :void (pin :int) (mode :int))

;; GPIO pin output control
(defcfun "digitalWrite" :void (pin :int) (value :int))

;; Waiting process
(defcfun "delay" :void (howlong :uint))

;; Set the state when nothing is connected to the terminal
(defcfun "pullUpDnControl" :void (pin :int) (pud :int))

;; Read the status of the GPIO pin
(defcfun "digitalRead" :int (pin :int))
