child_process = require 'child_process'

w = child_process.exec 'grunt watch'

w.on 'error', (err) -> console.error err.stack
w.stdout.pipe process.stdout
w.stderr.pipe process.stderr

require './'