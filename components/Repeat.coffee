# To work in msgflo-nodejs source tree
try
  msgflo = require 'msgflo-nodejs'
catch e
  msgflo = require '..'

RepeatParticipant = (client, role) ->

  definition =
    component: 'msgflo-components/Repeat'
    icon: 'file-word-o'
    label: 'Repeats indata without changes'
    inports: [
      id: 'in'
      type: 'any'
    ]
    outports: [
      id: 'out'
      type: 'any'
    ]
  process = (inport, indata, callback) ->
    return callback 'out', null, indata
  return new msgflo.participant.Participant client, definition, process, role

module.exports = RepeatParticipant
