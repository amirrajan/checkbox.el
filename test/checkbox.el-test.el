(ert-deftest checkbox/next-marker-test ()
  (should (string= (checkbox/next-marker " ") "x"))
  (should (string= (checkbox/next-marker "x") " "))
  (should (string= (checkbox/next-marker "NONSENSE") " ")))
