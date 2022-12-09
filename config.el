;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Set window frame to maximise on opening - haven't mastered this yet!
; (add-hook 'before-make-frame-hook
;           #'(lambda ()
;               (add-to-list 'default-frame-alist '(fullscreen . maximized))))

;; start the initial frame maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Kevin Gori"
  user-mail-address "kevin.c.gori@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

; (setq doom-font (font-spec :family "FiraCode Nerd Font" :size 12)
;       doom-variable-pitch-font (font-spec :family "Sofia Pro" :height 1.2))
(setq doom-font (font-spec :family "CaskaydiaCove Nerd Font" :size 13.0 :weight 'Regular)
      doom-variable-pitch-font (font-spec :family "Fira Sans"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
; (setq doom-theme 'doom-one)
; (setq doom-theme 'doom-city-lights)
; (setq doom-theme 'doom-Iosvkem)
; (setq doom-theme 'doom-gruvbox)
; (setq doom-theme 'doom-nord)
; (setq doom-theme 'doom-tomorrow-night)
(setq doom-theme 'doom-vibrant)
; (setq doom-theme 'doom-monokai-pro)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(setq confirm-kill-emacs nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-roam-directory "~/org/roam/")
(setq org-journal-dir "~/org/journal")
(setq org-journal-file-type 'monthly)
(setq denote-directory "~/org/denote")
(setq org-agenda-files '("~/org/agenda"))

;; Appearance in org-mode - setting up and handling mixed fonts
;; Improve org mode looks
(setq org-startup-indented t
  org-pretty-entities t
  org-hide-emphasis-markers t
  org-startup-with-inline-images t
  org-image-actual-width '(300))

;; Increase size of LaTeX fragment previews
(after! org (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0)))
(add-hook 'org-mode-hook
  (lambda ()
    (setq line-spacing 6)))

(add-hook 'org-mode-hook
           #'visual-line-mode)
           ; #'variable-pitch-mode)

;; Org Roam capture template
(after! (org org-roam)
  (add-to-list 'org-roam-capture-templates
               '("l" "latex-ready" plain "%?" :target
                  (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+LATEX_CLASS_OPTIONS: [12pt]
#+LATEX_HEADER: \\PassOptionsToPackage{style=nature}{biblatex}
#+LATEX_HEADER: \\usepackage[natbib=true,backend=biber]{biblatex} \\addbibresource{~/bib/paperpile.bib}
#+LATEX_HEADER: \\hypersetup{colorlinks,linkcolor=red,citecolor=blue,urlcolor=blue}
#+LATEX_HEADER: \\usepackage{parskip}
#+LATEX_HEADER: \\usepackage{charter} \\renewcommand\\familydefault{bch}
#+LATEX_HEADER: \\usepackage[margin=1.2in]{geometry}
#+title: ${title}
#+filetags: %^g
")
                :unnarrowed t)
))

;; Set calendar start of the week to Monday
(setq calendar-week-start-day 1)

; (add-hook 'org-mode-hook #'mixed-pitch-mode)
; (add-hook 'org-mode-hook #'solaire-mode)

; (add-hook 'mixed-pitch-mode-hook #'solaire-mode-reset)

(setq org-html-head-extra "<link rel=\"stylesheet\" type=\"text/css\" href=\"https://gongzhitaao.org/orgcss/org.css\"/>")
(setq org-html-head-include-default-style nil)


;; lsp
(after! rustic
  (setq rustic-lsp-server 'rust-analyzer))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; Set default, fixed and variabel pitch fonts
;; Use M-x menu-set-font to view available fonts
; (use-package! mixed-pitch
;   :hook
;   (org-mode . mixed-pitch-mode)
;   :config
;   (setq mixed-pitch-set-height nil))
  ; :config
  ; (set-face-attribute 'default nil :font "CaskaydiaCove Nerd Font":height 130)
  ; (set-face-attribute 'fixed-pitch nil :font "CaskaydiaCove Nerd Font")
  ; (set-face-attribute 'variable-pitch nil :font "Sofia Pro"))

;; Required for proportional font
; (use-package! company-posframe
;   :config
;   (company-posframe-mode 1))

;; Show hidden emphasis markers
(use-package! org-appear
  :hook (org-mode . org-appear-mode))


(use-package! denote)

(use-package! citar
  :bind (("C-c b" . citar-insert-citation)
         :map minibuffer-local-map
         ("M-b" . citar-insert-preset))
  :custom
  (citar-bibliography '("~/bib/paperpile.bib")))
