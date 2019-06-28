# To work in msgflo-nodejs source tree
try
  msgflo = require 'msgflo-nodejs'
catch e
  msgflo = require '..'

append_constant = "Hello"
append = (str) ->
  append_constant.concat str

AppendParticipant = (client, role) ->
  definition =
    component: 'msgflo-components/Append'
    icon: 'file-alt-o'
    label: 'Append a string to a string'
    inports: [{ id: 'const', type: 'string'}, { id: 'in', type: 'string' }]
    outports: [
      id: 'out'
      type: 'string'
    ]
  process = (inport, indata, callback) ->
    # console.log "Append #{inport}: #{indata}"
    if inport == "in"
      return callback 'out', null, append(" #{indata}")
    else if inport == "const"
      append_constant = indata
      return callback 'out', null, indata
    else
      return callback 'out', null, indata
  return new msgflo.participant.Participant client, definition, process, role

module.exports = AppendParticipant
