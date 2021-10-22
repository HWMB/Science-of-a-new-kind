;;;; celular-automata
;;;;
;;;; Dick Barends
;;;; 04-02-2021

(in-package :celular-automata)

;;; Het applicatie frame
(define-application-frame mdcfa ()
  ((rule-number :initform 30
                :accessor rule-number)
   (schaal-factor :initform (cons 1.0 0.01)
                  :accessor schaal-factor))
  (:pointer-documentation t)
  (:panes
   (app :application
        :height 800
        :width 800
        :display-function 'display-app
        :incremental-redisplay nil)
   (regels :application
           :height 200
           :width 400
           :display-function 'display-voorbeeld)
   (voorbeeld :application
              :height 600
              :width 400
              :display-function 'display-regels)
   (int :interactor
        :height 100
        :width 1200))
  (:reinitialize-frames t)
  (:layouts
   (default (vertically ()
              (horizontally  () app
                             (vertically ()
                               regels
                               voorbeeld))
              int)))) 

;; display  functie
(defun display-app (frame pane)
  (declare (ignore frame))
  (teken-ca pane (rule-number *application-frame* )))

(defun display-voorbeeld (frame pane)
  (declare (ignore frame))
  (teken-voorbeeld-ca pane(rule-number *application-frame* )))

(defun display-regels (frame pane)
  (declare (ignore frame))
  (teken-rekenregels-all pane (rule-number *application-frame* )))

;; Opdrachten    
(define-mdcfa-command (com-quit :name t :menu t) ()
  (frame-exit *application-frame*))

(define-mdcfa-command (com-rule :name t)
    ((number 'integer))
  (setf (rule-number *application-frame*) number))

(define-mdcfa-command (com-bal :name t) ()
  )

;; start het systeem
(Defun run-grafiek()
  (run-frame-top-level (make-application-frame 'mdcfa)))

