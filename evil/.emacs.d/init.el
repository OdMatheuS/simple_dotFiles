;;; Remover boas vindas
(setq inhibit-startup-message t)

;; Remover menus
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Remover barra de rolagem
(scroll-bar-mode -1)

;; Numeros nas Linhas

(global-linum-mode t)

;; Tamanho da fonte
(set-face-attribute 'default nil :height 120)

;; Pacotes
(require 'package)
(setq package-enable-at-startup nil) ;; desabilitar inicio ativacao pkg

;; MELPA - repo
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize) ;; iniciar pacotes

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Roda Pacotes sem Install temporariamente
(use-package try
  :ensure t)

;; Menu de Atalhos
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; Auto-Complete simples
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

;; Arvore de diretorios
(use-package neotree
  :ensure t
  :config (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  :bind (("C-\\" . 'neotree-toggle))) ;; atalho abrir menu

;; Icones para Neotree
(use-package all-the-icons
  :ensure t)

;; Tema
(load "suscolors-theme.el")
(load-theme 'suscolors t)


;; Navegacao de Janelas
(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))

;; Checagem de sintaxe
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t))

(unless (package-installed-p 'elixir-mode)
  (package-install 'elixir-mode))


;; Atalhos
(global-set-key (kbd "M-<left>") 'shirink-window-horizontally)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "C-<tab>") 'other-window)

;; Download Evil
;;(unless (package-installed-p 'evil)
;;  (package-install 'evil))

;; Enable Evil
;;(require 'evil)
;;(evil-mode 1)

;; Melpa stuff auto-generated
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2681c80b05b9b972e1c5e4d091efb9ba7bb5fa7dad810d9026bc79607a78f1c0" default))
 '(package-selected-packages
   '(alchemist lsp-mode elixir-mode flycheck suscolors-theme neotree auto-complete use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
