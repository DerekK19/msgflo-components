# To work in msgflo-nodejs source tree
try
  msgflo = require 'msgflo-nodejs'
catch e
  msgflo = require '..'

reverse = (s) ->
  if s.length < 2 then s else reverse(s[1..-1]) + s[0]

ReverseParticipant = (client, role) ->

  definition =
    component: 'msgflo-components/Reverse'
    icon: 'file-word-o'
    label: 'Reverses indata string'
    inports: [
      id: 'in'
      type: 'string'
    ]
    outports: [
      id: 'out'
      type: 'string'
    ]
  process = (inport, indata, callback) ->
    return callback 'out', null, reverse(indata)
  return new msgflo.participant.Participant client, definition, process, role

module.exports = ReverseParticipant
