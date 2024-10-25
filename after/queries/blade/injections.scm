((text) @injection.content
   (#not-has-ancestor? @injection.content "envoy")
   (#set! injection.combined)
   (#set! injection.language php))

; ((php_only) @injection.content
;    (#set! injection.language php_only))
;
; ((parameter) @injection.content
;     (#set! injection.include-children) ; You may need this, depending on your editor e.g Helix
;     (#set! injection.language "php-only"))
