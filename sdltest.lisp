(sdl:with-init ()
  (sdl:window 320 240)
  (sdl:draw-surface (load-image "lisp.bmp"))
  (sdl:update-display)
  (sdl:with-events ()
    (:quit-event () t)
    (:video-expose-event (sdl:update-display))))
(load-image "lisp.bmp")
(require 'lispbuilder-sdl-image)
(asdf:operate 'asdf:load-op :lispbuilder-sdl)
