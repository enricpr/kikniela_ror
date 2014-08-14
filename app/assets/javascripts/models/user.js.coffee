# for more details see: http://emberjs.com/guides/models/defining-models/

Kikniela.User = DS.Model.extend
  name: DS.attr 'string'
  points: DS.attr 'number'
  email: DS.attr 'string'
  encryptedPassword: DS.attr 'string'
  resetPasswordToken: DS.attr 'string'
  resetPasswordSentAt: DS.attr 'date'
  rememberCreatedAt: DS.attr 'date'
  signInCount: DS.attr 'number'
  currentSignInAt: DS.attr 'date'
  lastSignInAt: DS.attr 'date'
  currentSignInIp: DS.attr 'string'
  lastSignInIp: DS.attr 'string'
