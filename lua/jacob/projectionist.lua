vim.cmd([[
  let g:projectionist_heuristics = {
  \ "Gemfile&app/models/": {
  \   "app/models/*.rb": {
  \     "type": "model",
  \     "alternate": "spec/models/{}_spec.rb",
  \     "template": [
  \       "# frozen_string_literal: true",
  \       "",
  \       "class {camelcase|capitalize|colons} < ActiveRecord::Base",
  \       "end"
  \     ]
  \   },
  \   "app/events/*.rb": {
  \     "type": "event",
  \     "alternate": "spec/events/{}_spec.rb",
  \     "template": [
  \       "# frozen_string_literal: true",
  \       "",
  \       "class {camelcase|capitalize|colons} < Event",
  \       "end"
  \     ]
  \   },
  \   "spec/models/*_spec.rb": {
  \     "type": "spec",
  \     "template": [
  \       "# frozen_string_literal: true",
  \       "",
  \       "require \"rails_helper\"",
  \       "",
  \       "RSpec.describe {camelcase|capitalize|colons} do",
  \       "end"
  \     ]
  \   },
  \   "spec/events/*_spec.rb": {
  \     "alternate": "app/events/{}.rb",
  \     "type": "spec",
  \     "template": [
  \       "# frozen_string_literal: true",
  \       "",
  \       "require \"rails_helper\"",
  \       "",
  \       "RSpec.describe {camelcase|capitalize|colons} do",
  \       "end"
  \     ]
  \   }
  \ }
  \}
]])
