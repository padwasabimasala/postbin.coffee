exports.index = (req, res) ->
  res.render('index', { title: 'Express' })

exports.create = (req, res) ->
  console.log("headers: --------------------")
  console.dir(req.headers)
  console.log("params: --------------------")
  console.dir(req.params)
  console.log("body: --------------------")
  console.dir(req.body)
  res.render('index', { title: 'Express' })
