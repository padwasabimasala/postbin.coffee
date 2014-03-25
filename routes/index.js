
exports.index = function(req, res){
  res.render('index', { title: 'Express' });
};

exports.create = function(req, res){
  console.dir(req.headers)
  console.dir(req.body)
  res.render('index', { title: 'Express' });
}
