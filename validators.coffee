module.exports = (validator, app)->
  app.use validator
    customValidators:
      isUnique: (paramValue, model, paramName)->
        criteria = "{#{paramName}:#{paramValue}}"
        model.count(criteria, (e, c)->
          c
        ).then (count)->
          console.log count

