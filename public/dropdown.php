<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>

  <link href="http://v4-alpha.getbootstrap.com/assets/css/docs.min.css" rel="stylesheet">

<body>
<div class="row">
<div class="col-md-3 pull-right">asdfsd</div>
<input type="button" class="btn btn-default" value="test"/>
</div>
<!-- Split button -->
<div class="btn-group">
  <button type="button" class="btn btn-danger">Action</button>
  <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="sr-only">Toggle Dropdown</span>
  </button>
  <div class="dropdown-menu">
    <a class="dropdown-item" href="#">Action</a>
    <a class="dropdown-item" href="#">Another action</a>
    <a class="dropdown-item" href="#">Something else here</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="#">Separated link</a>
  </div>
</div>

</body>
<script src="http://v4-alpha.getbootstrap.com/assets/js/vendor/tether.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="http://v4-alpha.getbootstrap.com/dist/js/bootstrap.min.js"></script>

  <script type="text/javascript">
var bootstrap3_enabled = (typeof $().emulateTransitionEnd == 'function');
console.log(bootstrap3_enabled)
  </script>
</html>