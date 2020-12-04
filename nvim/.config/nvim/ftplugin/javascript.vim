setlocal suffixesadd+=.js,.jsx,.json

" modify the include path to have files that are imported with "require"
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
