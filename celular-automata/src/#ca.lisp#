;;;; Celular Automota (CA)
(in-package :celular-automata)

;;; (rekenregel input rule-number) => int [0|1]
(defun rekenregel (input rule-number)
  ""
  (let* ((rule-string (reverse (format nil "~8,'0b" rule-number)))
         (hulp (aref rule-string input)))
    (if (eq hulp #\0)
        0
        1)))
    

;;; Bereken de volgende generatie vanuit de hudige generatie plus de
;;; CA-rekenregel.
(defun bereken-regel (vorige-regel rule-number)
  (let* ((n 1000)
         (regel (make-array (list n) :initial-element 0))
         (rule-string (reverse (format nil "~8,'0b" rule-number))))
    (do ((i 0 (+ i 1)))
        ((>= i (- n 2)) regel)
      (setf (aref regel
                  (+ i 1))
            (let ((hulp (aref rule-string
                              (bit-to-int 
                               (subseq vorige-regel i (+ i 3))))))
              (if (eq hulp #\0)
                  0
                  1))))))

(defun teken-ca (pane rule)
  "Teken de gehele celular automaton"
  (let ((begin-lijn (make-array '(1000) :initial-element 0)))
    (setf (aref begin-lijn 500) 1)
    (loop for i from 0 to 500 do
      (loop for j from 0 upto 999 do
        (when (= (aref begin-lijn j) 1)
          (draw-point* pane j i )))
      (setf begin-lijn (bereken-regel begin-lijn rule)))))

(defun teken-voorbeeld-ca (pane rule)
  "Teken een deel (voorbeeld) van de celular sutomaton"
  (let ((begin-lijn (make-array '(1000) :initial-element 0)))
    (setf (aref begin-lijn 20) 1)
    (loop for i from 0 to 10 do
      (loop for j from 0 upto 39 do
        (when (= (aref begin-lijn j) 1)
          (draw-point* pane (* j 5) (* i 5) :line-thickness 5)))
      (setf begin-lijn (bereken-regel begin-lijn rule)))))

(defun teken-rekenregels (pane transf)
  (draw-rectangle* pane 0 0 10 10
                   :filled nil
                   :transformation transf)
  (draw-rectangle* pane 10 0 20 10
                   :filled nil
                   :transformation transf)
  (draw-rectangle* pane 20 0 30 10
                   :filled nil
                   :transformation transf)
  (draw-rectangle* pane 10 10 20 20
                   :filled nil
                   :transformation transf)
  (draw-point* pane 5 5
               :line-thickness 10
               :transformation transf)
  (draw-point* pane 15 5
               :line-thickness 10
               :transformation transf)
  (draw-point* pane 25 5
               :line-thickness 10
               :transformation transf)
  (draw-point* pane 15 15
               :line-thickness 10
               :transformation transf)
  )

(defun teken-rekenregels-1 (pane dx dy vec)
  (let ((ras #2A((1 1 1) (0 1 0))))
    (with-translation (pane dx dy)
      (loop for i from 0 to 1 do
        (loop for j from 0 to 2 do
          (when (= (aref ras i j) 1) (draw-rectangle* pane
                                                      (* 10 j) (* 10 i)
                                                      (+ (* 10 j) 10) (+ (* 10 i) 10)
                                                      :filled nil))))
      (loop for j from 0 to 2 do
        (when (= (aref (car vec) j) 1) (draw-point* pane
                                                    (+ (* 10 j) 5) (+ (* 10 0) 5)
                                                    :line-thickness 10))
        (when (= (aref (cdr vec) j) 1) (draw-point* pane
                                                    (+ (* 10 j) 5) (+ (* 10 1) 5)
                                                    :line-thickness 10))))))

  
(defun teken-rekenregels-all (pane rule)
  (loop for dy from 0 to 7  do
    (teken-rekenregels-1 pane 10 (* 30 dy)
                         (cons (int-convert dy 2 3)
                               (vector 0 (rekenregel dy rule) 0)))))
