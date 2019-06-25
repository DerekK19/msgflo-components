# To work in msgflo-nodejs source tree
try
  msgflo = require 'msgflo-nodejs'
catch e
  msgflo = require '..'

Append = (client, role) ->

  definition =
    component: 'msgflo-components/Append'
    icon: 'file-text-o'
    label: 'Append to a string'
    inports: [
      id: 'in'
      type: 'any',
      id: 'const'
	  type: 'string'
    ]
    outports: [
      id: 'out'
      type: 'any'
    ]
  process = (inport, indata, callback) ->
    return callback 'out', null, indata
  return new msgflo.participant.Participant client, definition, process, role

module.exports = Append
