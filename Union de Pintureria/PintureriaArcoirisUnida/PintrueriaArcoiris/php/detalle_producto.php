<?php include_once '../PintureriaArcoiris/encabezado/encabezado.php'; ?>
<link rel="stylesheet" href="../PintureriaArcoiris/encabezado/estilo-e.css">
<link rel="stylesheet" href="../PintureriaArcoiris/footer/estilo-p.css">
<script src="../PintureriaArcoiris/encabezado/scripts.js"></script>
<!DOCTYPE html>
<html>
<head>
  <title>Detalle del Producto</title>
  <link rel="stylesheet" type="text/css" href="../css/detalle_producto.css">
  
</head>
<body>
  <div class="container">
    <?php
    if (isset($_GET['id']) && is_numeric($_GET['id'])) {
        include 'conexion.php';

        $id_producto = $_GET['id'];

        $sql_producto = $conn->prepare("SELECT id_producto, marca, precio, imagen, `descripción` AS descripcion, stock_cantidad FROM productos WHERE id_producto = ?");
        $sql_producto->bind_param("i", $id_producto);
        $sql_producto->execute();
        $result_producto = $sql_producto->get_result();

        if ($result_producto->num_rows > 0) {
            $row_producto = $result_producto->fetch_assoc();
            $id_producto = $row_producto["id_producto"];
            $marca = $row_producto["marca"];
            $precio = $row_producto["precio"];
            $imagen = $row_producto["imagen"];
            $descripcion = $row_producto["descripcion"];
            $stock_cantidad = $row_producto["stock_cantidad"];

            echo '<div class="product-detail">';
            echo '<div class="product-info">';
            echo '<img src="' . $imagen . '" alt="' . $marca . '">';
            echo '<h2>' . $marca . '</h2>';
            echo '<p class="price">Precio: $' . $precio . '</p>';
            echo '<p class="stock">Stock disponible: ' . $stock_cantidad . '</p>';
            echo '<p class="description">' . $descripcion . '</p>';
            echo '</div>';
            echo '<div class="product-buttons">';
            echo '<form action="procesar_compra.php" method="post">';
            echo '<input type="hidden" name="id_producto" value="' . $id_producto . '">';
            echo '<label for="cantidad">Cantidad:</label>';
            echo '<select name="cantidad" id="cantidad">';
            for ($i = 1; $i <= $stock_cantidad; $i++) {
                echo '<option value="' . $i . '">' . $i . '</option>';
            }
            echo '</select>';
            echo '<label for="nombre">Nombre:</label>';
            echo '<input type="text" name="nombre" id="nombre" required>';
            echo '<label for="email">Email:</label>';
            echo '<input type="email" name="email" id="email" required>';
            echo '<button type="submit" class="buy-now">COMPRAR AHORA</button>';
            echo '</form>';
            echo '<form action="agregar_al_carrito.php" method="post">';
            echo '<input type="hidden" name="id_producto" value="' . $id_producto . '">';
            echo '<button type="submit" class="add-to-cart">AGREGAR AL CARRITO</button>';
            echo '</form>';
            echo '</div>';
            echo '</div>';
        } else {
            echo "Producto no encontrado.";
        }

        $sql_destacados = $conn->prepare("SELECT id_producto, marca, precio, imagen FROM productos WHERE id_producto <> ? LIMIT 6");
        $sql_destacados->bind_param("i", $id_producto);
        $sql_destacados->execute();
        $result_destacados = $sql_destacados->get_result();

        if ($result_destacados->num_rows > 0) {
            echo '<h3 class="featured-title">Productos Destacados</h3>';
            echo '<div class="product-thumbnails">';
            while ($row_destacado = $result_destacados->fetch_assoc()) {
                echo '<div class="product-thumbnail">';
                echo '<a href="detalle_producto.php?id=' . $row_destacado["id_producto"] . '">';
                echo '<img src="' . $row_destacado["imagen"] . '" alt="' . $row_destacado["marca"] . '">';
                echo '<h3>' . $row_destacado["marca"] . '</h3>';
                echo '<p>$' . $row_destacado["precio"] . '</p>';
                echo '</a>';
                echo '</div>';
            }
            echo '</div>';
        } else {
            echo "No se encontraron productos destacados.";
        }

        $conn->close();
    } else {
        echo "ID de producto no válido.";
    }
    ?>
  </div>
</body>
</html>
<?php include_once '../PintureriaArcoiris/footer/piedepagina.php'; ?>