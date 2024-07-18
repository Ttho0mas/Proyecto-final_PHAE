<?php include_once 'PintureriaArcoiris/encabezado/encabezado.php'; ?>
<!DOCTYPE html>
<html>
<head>
  <title>Productos Destacados</title>
  <link rel="stylesheet" href="PintureriaArcoiris/encabezado/estilo-e.css">
  <link rel="stylesheet" href="PintureriaArcoiris/footer/estilo-p.css">
  <link rel="stylesheet" href="Slider/styles.css">
  <script src="PintureriaArcoiris/encabezado/scripts.js"></script>
  <script src="Slider/script.js"></script>
  <link rel="stylesheet" type="text/css" href="css/css.css">
</head>
<body>
  <h1>PRODUCTOS DESTACADOS</h1>
  <div class="product-container">
    <?php include 'php/productos.php'; ?>
  </div>
  <?php include 'Slider/index.html'; ?>
</body>
</html>
<?php include_once 'PintureriaArcoiris/footer/piedepagina.php'; ?>
