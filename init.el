(install-packs '(epl
                 dash));; deps from prelude-core

(require 'url)

;; (unless (require 'prelude-core nil 'noerror)
;;     (with-temp-file "./lib/prelude-core.el"
;;       (insert-buffer (url-retrieve-synchronously "https://raw2.github.com/bbatsov/prelude/master/core/prelude-core.el"))))

(live-add-pack-lib "prelude-core.el")
(require 'prelude-core)
