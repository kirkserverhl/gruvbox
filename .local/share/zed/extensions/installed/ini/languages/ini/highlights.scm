(section_name
  (text) @type) ; consistency with toml

(comment) @comment

[
  "["
  "]"
] @punctuation.bracket

"=" @operator

(setting
  (setting_name) @property)
