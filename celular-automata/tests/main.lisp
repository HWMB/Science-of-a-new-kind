(defpackage celular-automata/tests/main
  (:use :cl
        :celular-automata
        :rove))
(in-package :celular-automata/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :celular-automata)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
