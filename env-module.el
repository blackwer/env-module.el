;;; env-module.el --- Wrapper for 'Environment Modules' to synchronize emacs environment with modules  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Robert Blackwell

;; Author: Robert Blackwell <rblackwell@flatironinstitute.org>
;; Keywords: processes, convenience

(require 'eshell)

(defun env-module-eval-string (string)
  "Evaluate a string of elisp code for side effects."
  (with-temp-buffer
    (insert string)
    (beginning-of-buffer)
    (setq dellines (flush-lines "^[^(]"))
    (eval-buffer)
    ))

(defun env-module-print (string)
  "Evaluate a string of elisp code for side effects."
  (with-temp-buffer
    (insert string)
    (beginning-of-buffer)
    (flush-lines "^(")
    (buffer-string)
    ))

(defun env-module (&rest args)
  "Call 'module' command with associated options."
  (setq args (eshell-flatten-and-stringify args))

  (let ((cmd (concat "/usr/bin/tclsh " (getenv "MODULES_CMD") " lisp " args)))
    (message cmd)
    (let ((cmd-output (shell-command-to-string cmd)))
      (env-module-eval-string cmd-output)
      (env-module-print cmd-output)
      )))
