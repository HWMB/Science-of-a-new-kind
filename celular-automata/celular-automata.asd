(defsystem "celular-automata"
  :version "0.1.0"
  :author "Dikc Barends"
  :license ""
  :depends-on (:mcclim :dck)
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "ca")
                 (:file "main" ))))
  :description "Celular automata uit a New kind of Science"
  :in-order-to ((test-op (test-op "celular-automata/tests"))))

(defsystem "celular-automata/tests"
  :author ""
  :license ""
  :depends-on ("celular-automata"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for celular-automata"
  :perform (test-op (op c) (symbol-call :rove :run c)))
