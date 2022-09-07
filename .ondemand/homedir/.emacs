;; -*- Emacs-Lisp -*-
;; import the master.emacs file
(defconst master-dir (getenv "LOCAL_ADMIN_SCRIPTS"))
(load-library (expand-file-name "master.emacs" master-dir))
