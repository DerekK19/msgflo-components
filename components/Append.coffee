# To work in msgflo-nodejs source tree
try
  msgflo = require 'msgflo-nodejs'
catch e
  msgflo = require '..'

AppendParticipant = (client, role) ->
  definition =
    component: 'msgflo-components/Append'
    icon: 'file-text-o'
    label: 'Append a string to a string'
    inports: [
      id: 'const'
      type: 'string',
      id: 'in'
      type: 'string'
    ]
    outports: [
      id: 'out'
      type: 'string'
    ]
  process = (inport, indata, callback) ->
    console.log "Append #{inport}: #{indata}"
    return callback 'out', null, indata
  return new msgflo.participant.Participant client, definition, process, role

module.exports = AppendParticipant
