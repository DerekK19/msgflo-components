# To work in msgflo-nodejs source tree
try
  msgflo = require 'msgflo-nodejs'
catch e
  msgflo = require '..'

add = (x, y) ->
  x + y

AddParticipant = (client, role) ->

  definition =
    component: 'msgflo-components/Repeat'
    icon: 'file-word-o'
    label: 'Add two inputs to make an output'
    inports: [
      id: 'const'
      type: 'number',
      id: 'in'
      type: 'number'
    ]
    outports: [
      id: 'out'
      type: 'any'
    ]
  process = (inport, indata, callback) ->
    console.log "Add #{inport}: #{indata}"
    if inport == "in"
      return callback 'out', null, add(indata, 42)
    else
      return callback 'out', null, indata
  return new msgflo.participant.Participant client, definition, process, role

module.exports = AddParticipant
