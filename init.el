;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
  You should not put any user code in this function besides modifying the variable
  values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; javascript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; (gtags :variables gtags-enable-by-default t)
     ;;helm
     ;; asm
     ivy
     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-private-snippets-directory "~/spacemacs.d/snippets/")
     better-defaults
     emacs-lisp
     (imenu-list :variables
                 imenu-list-focus-after-activation nil
                 imenu-list-position 'left
                 imenu-list-auto-resize t
                 )
     git
     (python :variables
             python-fill-column 80                ; 开启 80 列的提示
             ;; python-sort-imports-on-save t        ; 当保存的时候自动排序导入的包
             python-formatter 'yapf
             )
     ipython-notebook
     (org :variables
          org-superstar-leading-bullet "  "
          ;;org-roam
          org-enable-roam-support t
          org-enable-roam-protocol t
          org-roam-directory "~/Dropbox/org/roam"
          ;; org-roam-db-location "~/Dropbox/org/roam/org-roam.db"
          org-roam-v2-ack t
          )
     (deft :variables
           deft-zetteldeft t
           deft-directory "~/Dropbox/org/roam"
           deft-extensions `("org" "md" "txt")
           deft-use-filename-as-title t
           deft-use-filter-string-for-filename t
           deft-org-mode-title-prefix t
           deft-recursive t
       )
     (shell :variables
            shell-default-shell 'vterm
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-width 50
            shell-default-term-shell "/bin/zsh")
     spell-checking
     syntax-checking
     (version-control :variables
                      version-control-diff-side 'left)
     (c-c++ :variables c-c++-enable-clang-support t)
     ;;c-c++
     ;; semantic
     ;; ycmd
     (treemacs :variables
               ;; treemacs-use-follow-mode 'tag
               treemacs-use-filewatch-mode t
               )
     shell-scripts
     (lsp :variables lsp-lens-enable t
          lsp-ui-doc-enable nil
          lsp-ui-sideline-enable nil
          )
     semantic
     graphviz
     (spacemacs-layouts :variables layouts-enable-autosave t
                        layouts-autosave-delay 300)
     (plantuml :variables plantuml-jar-path "~/Dropbox/plantuml.jar"
               org-plantuml-jar-path "~/Dropbox/plantuml.jar"
               )

     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(evil-escape websocket simple-httpd dired-hide-dotfiles posframe memory-usage anki-editor)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-but-keep-unused))

(defun dotspacemacs/init ()
  "Initialization function.
  This function is called at the very startup of Spacemacs initialization
  before layers configuration.
  You should not put any user code in there besides modifying the variable
  values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("YaHei Consolas Hybrid"
                               :size 26
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
  It is called immediately after `dotspacemacs/init', before layer configuration
  executes.
  This function is mostly useful for variables that need to be set
  before packages are loaded. If you are unsure, you should try in setting them in
  `dotspacemacs/user-config' first."
  (setq configuration-layer-elpa-archives
        '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
          ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
          ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))
	)
  ;;(setq exec-path-from-shell-check-startup-files nil)

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
  This function is called at the very end of Spacemacs initialization after
  layers configuration.
  This is the place where most of your configurations should be done. Unless it is
  explicitly specified that a variable should be set before a package is loaded,
  you should place your code here."
  (setq powerline-default-separator 'slant)
  (defun my-c-mode-font-lock-if0 (limit)
    (save-restriction
      (widen)
      (save-excursion
        (goto-char (point-min))
        (let ((depth 0) str start start-depth)
          (while (re-search-forward "^\\s-*#\\s-*\\(if\\|else\\|endif\\)" limit 'move)
            (setq str (match-string 1))
            (if (string= str "if")
                (progn
                  (setq depth (1+ depth))
                  (when (and (null start) (looking-at "\\s-+0"))
                    (setq start (match-end 0)
                          start-depth depth)))
              (when (and start (= depth start-depth))
                (c-put-font-lock-face start (match-beginning 0) 'font-lock-comment-face)
                (setq start nil))
              (when (string= str "endif")
                (setq depth (1- depth)))))
          (when (and start (> depth 0))
            (c-put-font-lock-face start (point) 'font-lock-comment-face)))))
    nil)

  (defun my-c-mode-common-hook ()
    (font-lock-add-keywords
     nil
     '((my-c-mode-font-lock-if0 (0 font-lock-comment-face prepend))) 'add-to-end))

  (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

  (setq linum-format "%d ")
  ;; {{ https://github.com/syl20bnr/evil-escape
  ;; (require 'evil-escape)
  (setq-default evil-escape-delay 0.5)
  (setq evil-escape-excluded-major-modes '(dired-mode))
  (setq evil-escape-excluded-major-modes (list 'magit-status-mode 'magit-refs-mode 'magit-log-mode 'magit-revision-mode 'compilation-mode 'magit-stash-mode))
  (setq-default evil-escape-key-sequence "kj")
  (evil-escape-mode 1)
  ;; }}

  (add-to-list 'load-path "~/.spacemacs.d/site-lisp/auto-save")
  (require 'auto-save)            ;; 加载自动保存模块
  (auto-save-enable)              ;; 开启自动保存功能
  (setq auto-save-slient t)       ;; 自动保存的时候静悄悄的， 不要打扰我
  ;; ':' will discard when enter eshell
  (add-hook 'eshell-mode-hook
            (lambda ()
              (define-key eshell-mode-map (kbd ":") nil)))
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  ;;(setq c-default-style "k&r")
  (setq c-default-style "bsd")
  (setq c-basic-offset 4)
  (add-hook 'imenu-list-after-jump-hook #'recenter-top-bottom)
  ;; if imenu-list autostart
  ;; (setq imenu-list-minor-mode t)

  (add-to-list 'load-path "~/.spacemacs.d/site-lisp/etags/")
  (require 'counsel-etags)
  (define-key evil-normal-state-map (kbd ", j d") 'counsel-etags-find-tag-at-point)
  (define-key evil-normal-state-map (kbd ", j t") 'counsel-etags-grep)
  (define-key evil-visual-state-map (kbd ", j t") 'counsel-etags-grep)
  (define-key evil-normal-state-map (kbd ", j i") 'counsel-etags-list-tag-in-current-file)
  ;; Don't ask before rereading the TAGS files if they have changed
  (setq tags-revert-without-query t)
  ;; Don't warn when TAGS files are large
  (setq large-file-warning-threshold nil)
  ;; How many seconds to wait before rerunning tags for auto-update
  (setq counsel-etags-update-interval 10)
  (eval-after-load 'counsel-etags
    '(progn
       ;; counsel-etags-ignore-directories does NOT support wildcast
       (add-to-list 'counsel-etags-ignore-directories "build")
       (add-to-list 'counsel-etags-ignore-directories "build_clang")
       ;; counsel-etags-ignore-filenames supports wildcast
       (add-to-list 'counsel-etags-ignore-filenames "TAGS")
       (add-to-list 'counsel-etags-ignore-filenames "*.json")))

    (defface hl-highlight
      '((((class color) (min-colors 88) (background light))
         :background "darkseagreen2")
        (((class color) (min-colors 88) (background dark))
         :background "darkolivegreen")
        (((class color) (min-colors 16) (background light))
         :background "darkseagreen2")
        (((class color) (min-colors 16) (background dark))
         :background "darkolivegreen")
        (((class color) (min-colors 8))
         :background "green" :foreground "black")
        (t :inverse-video t))
      "Basic face for highlighting."
      :group 'hl-line)
    (add-hook 'imenu-list-major-mode-hook
              (lambda ()
                (hl-line-mode -1)
                (setq hl-line-overlay
                      (let ((ol (make-overlay (point) (point))))
                        (overlay-put ol 'priority -50)           ;(bug#16192)
                        (overlay-put ol 'face 'hl-highlight)
                        ol))
                (hl-line-mode 1)))

    ;; disable clangd auto fill headers
    (setq lsp-clients-clangd-args `(
                                   "-j=2"
                                   "--log=error"
                                    "--header-insertion=never"
                                    "--header-insertion-decorators=0"
                                    "--limit-results=20"
                                    "--background-index=false"))

    (setq tags-add-tables nil)
    (add-to-list 'auto-mode-alist '("Makefile.*" . makefile-gmake-mode))

    ;; hidden org-download annotation
    (setq org-download-annotate-function (lambda (_link) ""))
    (setq-default org-download-image-dir "./img")

    (defun org-hide-properties ()
      "Hide all org-mode headline property drawers in buffer. Could be slow if it has a lot of overlays."
      (interactive)
      (save-excursion
        (goto-char (point-min))
        (while (re-search-forward
                "^ *:properties:\n\\( *:.+?:.*\n\\)+ *:end:\n" nil t)
          (let ((ov_this (make-overlay (match-beginning 0) (match-end 0))))
            (overlay-put ov_this 'display "")
            (overlay-put ov_this 'hidden-prop-drawer t))))
      (put 'org-toggle-properties-hide-state 'state 'hidden))

    (defun org-show-properties ()
      "Show all org-mode property drawers hidden by org-hide-properties."
      (interactive)
      (remove-overlays (point-min) (point-max) 'hidden-prop-drawer t)
      (put 'org-toggle-properties-hide-state 'state 'shown))

    (defun org-toggle-properties ()
      "Toggle visibility of property drawers."
      (interactive)
      (if (eq (get 'org-toggle-properties-hide-state 'state) 'hidden)
          (org-show-properties)
        (org-hide-properties)))

    (setq org-roam-complete-everywhere t)

    (add-to-list 'display-buffer-alist
                 '("\\*org-roam\\*"
                   (display-buffer-in-direction)
                   (direction . right)
                   (window-width . 0.33)
                   (window-height . fit-window-to-buffer)))
    ;; org-roam-node-find show backlinks
    (cl-defmethod org-roam-node-directories ((node org-roam-node))
      (if-let ((dirs (file-name-directory (file-relative-name (org-roam-node-file node) org-roam-directory))))
          (format "(%s)" (car (f-split dirs)))
        ""))

    (cl-defmethod org-roam-node-backlinkscount ((node org-roam-node))
      (let* ((count (caar (org-roam-db-query
                           [:select (funcall count source)
                                    :from links
                                    :where (= dest $s1)
                                    :and (= type "id")]
                           (org-roam-node-id node)))))
        (format "[%d]" count)))

    (setq org-roam-node-display-template "${directories:10} ${tags:10} ${title:100} ${backlinkscount:6}")

    (defun org-roam-node-insert-immediate (arg &rest args)
      (interactive "P")
      (let ((args (cons arg args))
            (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                      '(:immediate-finish t)))))
        (apply #'org-roam-node-insert args)))

    (defun my/open-org-inbox-file()
      "Open ~/Dropbox/org/inbox.org file"
      (interactive)
      (find-file "~/Dropbox/org/inbox.org"))
    (global-set-key (kbd "<f12>") 'my/open-org-inbox-file)

    (defun my/open-org-journal-file()
      "Open ~/Dropbox/org/journal/journal.org file"
      (interactive)
      (find-file "~/Dropbox/org/journal/journal.org"))
    (global-set-key (kbd "<f9>") 'my/open-org-journal-file)

    (setq org-enforce-todo-dependencies t)
    (setq org-todo-keyword-faces '(("TODO" . "red")
                                  ("DOING" . "yellow")
                                  ("DONE" . "green")))
    (setq org-todo-keywords '((sequence "TODO(t!)" "DOING(i!)" "|" "DONE(d!)" "ABORT(a!)")))
    (setq org-capture-templates '(("t" "Todo [inbox]" entry
                                   (file+headline "~/Dropbox/org/gtd.org" "Tasks")
                                   "* TODO %i%?")
                                ("j" "Journal"  entry
                                  (file+datetree "~/Dropbox/org/journal/journal.org")
                                  "* %U - %^{heading} %^g\n %?\n")
                                ("n" "Notes" entry (file "~/Dropbox/org/inbox.org")
                                  "* %^{heading}  %^g\n  %?\n")
                                ))

    ;; this controls the color of bold, italic, underline, verbatim, strikethrough
    (setq org-emphasis-alist
    '(("*" (bold :foreground "Orange" ))
            ("/" (italic :foreground "dark salmon" )) ;; italic text, the text will be "dark salmon"
            ("_" underline :foreground "cyan" ) ;; underlined text, color is "cyan"
            ("=" (:foreground "sky blue" )) ;; background of text is "snow1" and text is "deep slate blue"
            ("~" (:background "PaleGreen1" :foreground "dim gray" ))
            ("+" (:strike-through t))))
    ;; (setq org-hide-emphasis-markers t) ;; hides the emphasis markers

    ;; toggle open/fold source blocks
    (defvar org-blocks-hidden nil)
    (defun org-toggle-blocks ()
      (interactive)
      (if org-blocks-hidden
          (org-show-block-all)
        (org-hide-block-all))
      (setq-local org-blocks-hidden (not org-blocks-hidden)))

    (add-hook 'org-mode-hook 'org-toggle-blocks)
    (define-key org-mode-map (kbd "C-c t") 'org-toggle-blocks)

    (setq org-startup-with-inline-images nil)

    ;; speed up magit
    (setq magit-revision-insert-related-refs nil)
    (remove-hook 'magit-status-sections-hook 'magit-insert-status-headers)
    (setq org-image-actual-width '(800))

    (add-to-list 'load-path "~/.spacemacs.d/site-lisp/ox-rst")
    (require 'ox-rst)

    ;; org-roam-ui
    (add-to-list 'load-path "~/.spacemacs.d/site-lisp/org-roam-ui")
    (load-library "org-roam-ui")
    (use-package websocket
      :after org-roam)
    (use-package org-roam-ui
      :after org-roam;; or:after org
      :hook (org-roam . org-roam-ui-mode)
      :config)
    (setq org-startup-folded t)
    ;; deft with org-roam-v2
    (defun cm/deft-parse-title (file contents)
      "Parse the given FILE and CONTENTS and determine the title.
  If `deft-use-filename-as-title' is nil, the title is taken to
  be the first non-empty line of the FILE.  Else the base name of the FILE is
  used as title."
      (let ((begin (string-match "^#\\+[tT][iI][tT][lL][eE]: .*$" contents)))
	    (if begin
	        (string-trim (substring contents begin (match-end 0)) "#\\+[tT][iI][tT][lL][eE]: *" "[\n\t ]+")
	      (deft-base-filename file))))

    (advice-add 'deft-parse-title :override #'cm/deft-parse-title)

    (setq deft-strip-summary-regexp
	      (concat "\\("
		          "[\n\t]" ;; blank
		          "\\|^#\\+[[:alpha:]_]+:.*$" ;; org-mode metadata
		          "\\|^:PROPERTIES:\n\\(.+\n\\)+:END:\n"
		          "\\)"))
    ;; reserve break line when org to html
    (setq org-export-preserve-breaks t)
    (setq dired-listing-switches "-agho --group-directories-first")
    (use-package dired-hide-dotfiles
      :hook (dired-mode . dired-hide-dotfiles-mode)
      :config
      (evil-collection-define-key 'normal 'dired-mode-map
        "H" 'dired-hide-dotfiles-mode))
    (require 'posframe)
    (add-to-list 'load-path "~/.spacemacs.d/site-lisp/emacs-rime")
    (require 'rime)
    (setq rime-user-data-dir "~/.config/fcitx/rime")
    (setq rime-posframe-properties
          (list :background-color "#333333"
                :foreground-color "#dcdccc"
                :font "YaHei Consolas Hybrid"
                :internal-border-width 10))
    (setq default-input-method "rime"
          rime-show-candidate 'posframe)
    ;;https://sunyour.org/post/emacs-%E5%86%85%E7%BD%AE%E8%BE%93%E5%85%A5%E6%B3%95%E6%AD%A3%E5%BC%8F%E6%94%B9%E7%94%A8-emacs-rime/
    (defun +rime--char-before-to-string (num)
      (let* ((point (point))
             (point-before (- point num)))
        (when (and (> point-before 0)
                   (char-before point-before))
          (char-to-string (char-before point-before)))))

    (defun +rime--string-match-p (regexp string &optional start)
      (and (stringp regexp)
           (stringp string)
           (string-match-p regexp string start)))

    (defun +rime--probe-auto-english ()
      (let ((str-before-1 (+rime--char-before-to-string 0))
            (str-before-2 (+rime--char-before-to-string 1)))
        (unless (string= (buffer-name) " *temp*")
          (if (> (point) (save-excursion (back-to-indentation)
                                         (point)))
              (or (if (+rime--string-match-p " " str-before-1)
                      (+rime--string-match-p "\\cc" str-before-2)
                    (not (+rime--string-match-p "\\cc" str-before-1))))))))

    (defun +rime--beancount-p ()
      (when (derived-mode-p 'beancount-mode)
        (not (or (nth 3 (syntax-ppss))
                 (nth 4 (syntax-ppss))))))

    (defun +rime--evil-mode-p ()
      (or (evil-normal-state-p)
          (evil-visual-state-p)
          (evil-motion-state-p)
          (evil-operator-state-p)))

    (defun +rime-english-prober()
      (let ((use-en (or (button-at (point))
                        (+rime--evil-mode-p))))
        (if (derived-mode-p 'telega-chat-mode)
            (setq use-en (or use-en
                             (+rime--probe-auto-english)))
          (when (derived-mode-p 'text-mode)
            (setq use-en (or use-en
                             (+rime--probe-auto-english))))
          (when (derived-mode-p 'prog-mode 'conf-mode)
            (setq use-en (or use-en
                             (rime--after-alphabet-char-p))))
          (setq use-en (or use-en
                           (rime--prog-in-code-p)
                           (+rime--beancount-p))))
        use-en))

    (setq rime-disable-predicates '(+rime-english-prober))
    (setq org-agenda-files '("~/Dropbox/org/gtd.org"))

    ;; <s TAB
    (require 'org-tempo)
    (add-to-list 'load-path (expand-file-name "~/.spacemacs.d/site-lisp/company-english-helper"))
    (require 'company-english-helper)

    (setq org-roam-ui-sync-theme nil)
    (defun file-name-only ()
      "Get the current buffer file name without directory."
      (file-name-nondirectory (buffer-name)))
    (defun file-name-only-noext ()
      "Get the current buffer file name without directory and extension."
      (file-name-sans-extension (file-name-only)))

    (add-to-list 'load-path "~/.spacemacs.d/site-lisp/org-excalidraw")
    (require 'org-excalidraw)
    (setq org-excalidraw-directory "~/Dropbox/org/org_excalidraw")
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (x86-lookup nasm-mode lv insert-shebang fish-mode company-shell wgrep smex ivy-hydra flyspell-correct-ivy counsel-projectile counsel swiper ivy flycheck-irony company-irony irony flycheck-ycmd company-ycmd ycmd stickyfunc-enhance srefactor ac-ispell fill-column-indicator yapfify xterm-color ws-butler winum which-key volatile-highlights vmd-mode vi-tilde-fringe uuidgen use-package unfill toc-org spaceline smeargle shell-pop restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file neotree mwim multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint indent-guide imenu-list hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md ggtags fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav ein dumb-jump disaster diminish diff-hl define-word cython-mode company-statistics company-quickhelp company-c-headers company-anaconda column-enforce-mode cmake-mode clean-aindent-mode clang-format auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (dap-mode bui x86-lookup nasm-mode lv insert-shebang fish-mode company-shell wgrep smex ivy-hydra flyspell-correct-ivy counsel-projectile counsel swiper ivy flycheck-irony company-irony irony flycheck-ycmd company-ycmd ycmd stickyfunc-enhance srefactor ac-ispell fill-column-indicator yapfify xterm-color ws-butler winum which-key volatile-highlights vmd-mode vi-tilde-fringe uuidgen use-package unfill toc-org spaceline smeargle shell-pop restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file neotree mwim multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint indent-guide imenu-list hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md ggtags fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav ein dumb-jump disaster diminish diff-hl define-word cython-mode company-statistics company-quickhelp company-c-headers company-anaconda column-enforce-mode cmake-mode clean-aindent-mode clang-format auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(safe-local-variable-values
   (quote
    ((eval setq org-download-image-dir
           (file-name-sans-extension
            (buffer-name)))
     (c-indent-level . 4)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
