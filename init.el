(install-packs '(epl
                 dash));; deps from prelude-core

(require 'url)

;; (unless (require 'prelude-core nil 'noerror)
;;     (with-temp-file "./lib/prelude-core.el"
;;       (insert-buffer (url-retrieve-synchronously "https://raw2.github.com/bbatsov/prelude/master/core/prelude-core.el"))))

(live-add-pack-lib "prelude-core.el")
(require 'prelude-core)

;; define prelude-mode
(require 'whitespace)

(defvar prelude-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c o") 'prelude-open-with)
    (define-key map (kbd "C-c g") 'prelude-google)
    (define-key map (kbd "C-c G") 'prelude-github)
    (define-key map (kbd "C-c y") 'prelude-youtube)
    (define-key map (kbd "C-c U") 'prelude-duckduckgo)
    ;; mimic popular IDEs binding, note that it doesn't work in a terminal session
    (define-key map [(shift return)] 'prelude-smart-open-line)
    (define-key map (kbd "M-o") 'prelude-smart-open-line)
    (define-key map [(control shift return)] 'prelude-smart-open-line-above)
    (define-key map [(control shift up)]  'move-text-up)
    (define-key map [(control shift down)]  'move-text-down)
    (define-key map [(meta shift up)]  'move-text-up)
    (define-key map [(meta shift down)]  'move-text-down)
    (define-key map (kbd "C-c n") 'prelude-cleanup-buffer)
    (define-key map (kbd "C-c f")  'prelude-recentf-ido-find-file)
    (define-key map (kbd "C-M-\\") 'prelude-indent-region-or-buffer)
    (define-key map (kbd "C-M-z") 'prelude-indent-defun)
    (define-key map (kbd "C-c u") 'prelude-view-url)
    (define-key map (kbd "C-c e") 'prelude-eval-and-replace)
    (define-key map (kbd "C-c s") 'prelude-swap-windows)
    (define-key map (kbd "C-c D") 'prelude-delete-file-and-buffer)
    (define-key map (kbd "C-c d") 'prelude-duplicate-current-line-or-region)
    (define-key map (kbd "C-c M-d") 'prelude-duplicate-and-comment-current-line-or-region)
    (define-key map (kbd "C-c r") 'prelude-rename-file-and-buffer)
    (define-key map (kbd "C-c t") 'prelude-visit-term-buffer)
    (define-key map (kbd "C-c k") 'prelude-kill-other-buffers)
    (define-key map (kbd "C-c TAB") 'prelude-indent-rigidly-and-copy-to-clipboard)
    (define-key map (kbd "C-c h") 'helm-prelude)
    (define-key map (kbd "C-c +") 'prelude-increment-integer-at-point)
    (define-key map (kbd "C-c -") 'prelude-decrement-integer-at-point)
    (define-key map (kbd "C-c I") 'prelude-find-user-init-file)
    (define-key map (kbd "C-c S") 'prelude-find-shell-init-file)

    (define-key map (kbd "C-c j") 'prelude-top-join-line)
    (define-key map (kbd "C-c K") 'prelude-kill-whole-line)

    (define-key map (kbd "C-c O") 'prelude-smart-open-line-above)

    map)
  "Keymap for Prelude mode.")

;; define minor mode
(define-minor-mode prelude-mode
  "Minor mode to consolidate Emacs Prelude extensions.

\\{prelude-mode-map}"
  :lighter " Pre"
  :keymap prelude-mode-map)

(define-globalized-minor-mode prelude-global-mode prelude-mode prelude-on)

(defun prelude-on ()
  "Turn on `prelude-mode'."
  (prelude-mode +1))

(defun prelude-off ()
  "Turn off `prelude-mode'."
  (prelude-mode -1))

(prelude-global-mode)
