(install-packs '(epl
                 dash));; prelude-core deps

(require 'url)

;; (unless (require 'prelude-core nil 'noerror)
;;     (with-temp-file "./lib/prelude-core.el"
;;       (insert-buffer (url-retrieve-synchronously "https://raw2.github.com/bbatsov/prelude/master/core/prelude-core.el"))))

(live-add-pack-lib "prelude-core.el")
(require 'prelude-core)

(require 'whitespace)

(defvar prelude-pack-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c o") 'prelude-open-with)
    (define-key map (kbd "C-c b g") 'prelude-google)
    (define-key map (kbd "C-c b G") 'prelude-github)
    (define-key map (kbd "C-c b y") 'prelude-youtube)
    (define-key map (kbd "C-c b U") 'prelude-duckduckgo)
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
    (define-key map (kbd "C-c t") 'prelude-visit-term-buffer)
    (define-key map (kbd "C-c k") 'prelude-kill-other-buffers)
    (define-key map (kbd "C-c TAB") 'prelude-indent-rigidly-and-copy-to-clipboard)
    (define-key map (kbd "C-c +") 'prelude-increment-integer-at-point)
    (define-key map (kbd "C-c -") 'prelude-decrement-integer-at-point)
    (define-key map (kbd "C-c I") 'prelude-find-user-init-file)
    (define-key map (kbd "C-c S") 'prelude-find-shell-init-file)

    (define-key map (kbd "C-c r d") 'prelude-duplicate-current-line-or-region)
    (define-key map (kbd "C-c r M-d") 'prelude-duplicate-and-comment-current-line-or-region)
    (define-key map (kbd "C-c r R") 'prelude-rename-file-and-buffer)
    (define-key map (kbd "C-c r j") 'prelude-top-join-line)
    (define-key map (kbd "C-c r k") 'prelude-kill-whole-line)

    (define-key map (kbd "C-c C-o") 'prelude-smart-open-line-above)

    map)
  "Keymap for Prelude mode.")

;; define minor mode
(define-minor-mode prelude-pack-mode
  "Minor mode to consolidate my emacs-live's prelude-pack extensions.

\\{prelude-pack-mode-map}"
  :lighter " Pre"
  :keymap prelude-pack-mode-map)

(define-globalized-minor-mode prelude-pack-global-mode prelude-pack-mode prelude-on)

(defun prelude-on ()
  "Turn on `prelude-pack-mode'."
  (prelude-pack-mode +1))

(defun prelude-off ()
  "Turn off `prelude-pack-mode'."
  (prelude-pack-mode -1))

(prelude-pack-global-mode)
