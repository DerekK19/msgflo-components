# To work in msgflo-nodejs source tree
try
  msgflo = require 'msgflo-nodejs'
catch e
  msgflo = require '..'

subtract_constant = 3
subtract = (x) ->
  x-subtract_constant

SubtractParticipant = (client, role) ->

  definition =
    component: 'msgflo-components/Subtract'
    icon: 'cog'
    label: 'Subtract two inputs to make an output'
    inports: [{ id: 'const', type: 'number'}, { id: 'in', type: 'number' }]
    outports: [
      id: 'out'
      type: 'number'
    ]
  process = (inport, indata, callback) ->
    # console.log "Subtract #{inport}: #{indata}"
    if inport == "in"
      return callback 'out', null, subtract(indata)
    else if inport == "const"
      subtract_constant = indata
      return callback 'out', null, indata
    else
      return callback 'out', null, indata
  return new msgflo.participant.Participant client, definition, process, role

module.exports = SubtractParticipant
